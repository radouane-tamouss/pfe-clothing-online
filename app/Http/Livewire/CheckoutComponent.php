<?php

namespace App\Http\Livewire;
use App\Models\Transaction;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Shipping;

use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Stripe;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderMail;

use Cart;

class CheckoutComponent extends Component
{

    public $firstname;
    public $lastname;
    public $email;
    public $mobile;
    public $line1;
    public $city;
    public $zipcode;

    public $paymentmode;
    public $thankyou;
    public $card_no;
    public $exp_month;
    public $exp_year;
    public $cvc;
    

    public function updated($fields)
    {
        $this->validateOnly($fields,[
            'firstname' => 'required',
            'lastname' => 'required',
            'email' => 'required|email',
            'mobile' => 'required|numeric',
            'line1' => 'required',
         
            'city' => 'required',
           
            'zipcode' => 'required',
            'paymentmode' => 'required'

        ]);

        if($this->paymentmode == 'card'){

            $this->validateOnly($fields,[
                 'card_no' => 'required|numeric',
                 'exp_month' => 'required|numeric',
                 'exp_year' => 'required|numeric',
                 'cvc' => 'required|numeric'
        
            ]);
            
    
      }
    }

   

    public function placeOrder()
    {
        $this->validate([
            'firstname' => 'required',
            'lastname' => 'required',
            'email' => 'required|email',
            'mobile' => 'required|numeric',
            'line1' => 'required',
            'city' => 'required',
            'zipcode' => 'required',
            'paymentmode' => 'required'
        ]);

        if($this->paymentmode == 'card')
        {
            $this->validate([
                 'card_no' =>'required|numeric',
                 'exp_month' =>'required|numeric',
                 'exp_year' =>'required|numeric',
                 'cvc' =>'required|numeric'
        
            ]);
            
    
        }
        


        $order = new Order();
        $order->user_id = Auth::user()->id;
        $order->subtotal = session()->get('checkout')['subtotal'];
        $order->tax = session()->get('checkout')['tax'];
        $order->total = session()->get('checkout')['total'];
        $order->firstname  = $this->firstname;
        $order->lastname  = $this->lastname;
        $order->email = $this-> email;
        $order->mobile = $this->mobile;
        $order->line1 = $this->line1;
        $order->city  = $this->city;
        $order-> zipcode = $this->zipcode;
        $order->status = 'ordered';
        $order->save();
 
 
        foreach(Cart::content() as $item)
        {
            $orderItem =  new OrderItem();
            $orderItem -> product_id = $item->id;
            $orderItem -> order_id = $order->id;
            $orderItem -> price = $item->price;
            $orderItem -> quantity = $item->qty;
            $orderItem -> save();
        }

        $shipping = new Shipping();
    
       $shipping->firstname  = $this->firstname;
       $shipping->order_id = $order->id;
       $shipping->lastname  = $this->lastname;
       $shipping-> email = $this->email;
       $shipping-> mobile = $this->mobile;
       $shipping-> line1 = $this->line1;
       $shipping-> city  = $this->city;
       $shipping-> zipcode = $this->zipcode;
       $shipping->save();

      
if($this->paymentmode == 'cod')
{
	$this->makeTransaction($order->id,'pending');
	$this->resetCart();
}  
else if($this->paymentmode == 'card')
{
	$stripe = Stripe::make(env('STRIPE_KEY'));

	try{
		$token = $stripe->tokens()->create([
			'card' => [
				'number' => $this->card_no,
				'exp_month' => $this->exp_month,
				'exp_year' => $this->exp_year,
				'cvc' => $this->cvc
			]
		]);

		if(!isset($token['id']))
		{
			session()->flash('stripe_error','The stripe token was not generated correctly!');
			$this->thankyou = 0;
		}

		$customer = $stripe->customers()->create([
			'name' => $this->firstname . ' ' . $this->lastname,
			'email' =>$this->email,
			'phone' =>$this->mobile,
			'address' => [
				'line1' =>$this->line1,
				'postal_code' => $this->zipcode,
				'city' => $this->city,
				
			
			],
			'shipping' => [
				'name' => $this->firstname . ' ' . $this->lastname,
				'address' => [
					'line1' =>$this->line1,
					'postal_code' => $this->zipcode,
					'city' => $this->city,
					
				
				],
			],
			'source' => $token['id']
		]);

		$charge = $stripe->charges()->create([
			'customer' => $customer['id'],
			'currency' => 'MAD',
			'amount' => session()->get('checkout')['total'],
			'description' => 'Payment for order no ' . $order->id
		]);

		if($charge['status'] == 'succeeded')
		{
			$this->makeTransaction($order->id,'approved');
			$this->resetCart();
		}
		else
		{
			session()->flash('stripe_error','Error in Transaction!');
			$this->thankyou = 0;
		}
	} catch(Exception $e){
		session()->flash('stripe_error',$e->getMessage());
		$this->thankyou = 0;
	}

    
}  
$this->sendOrderConfirmationMail($order);

      
      
  
       
      


    }

    public function resetCart()
    {
     $this->thankyou = 1;
     Cart::destroy();
     session()->forget('checkout');

    }

    public function makeTransaction($order_id, $status)
    {
     $transaction = new Transaction();
     $transaction->user_id = Auth::user()->id;
     $transaction->order_id = $order_id;
     $transaction->mode = $this->paymentmode;
     $transaction -> status = $status;
     $transaction->save();
    }

    public function verifyForCheckout()
    {
        if(!Auth::check())
        {
            return redirect()->route('login');
        }
        else if($this->thankyou){
            return redirect()->route('thankyou');

        }
        else if(!session()->get('checkout'))
        {
            return redirect()-> route('product.cart');
        }
    }

    public function sendOrderConfirmationMail($order)
    {
        Mail::to($order->email)->send(new OrderMail($order));
    }
    

   
  

    public function render()
    {
        $this->verifyForCheckout();
        return view('livewire.checkout-component')->layout("layouts.base");
    }
}
