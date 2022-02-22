
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Confirmation de la commande </title>
</head>
<body>
    <p>Salut {{$order->firstname}} {{$order->lastname}}</p>
    <p>Votre commande a été passée avec succès.</p>
    <br/>

    <table style="width: 600px; text-align:right">
        <thead>
            <tr>
                <th>Image</th>
                <th>produit</th>
                <th>Quantity</th>
                <th>prix</th>
            </tr>
        </thead>
        <tbody>
            @foreach($order->orderItems as $item)
                <tr>
                    <td><img src="{{asset('assets/images/products')}}/{{$item->product->image}}" width="100" /></td>
                    <td>{{$item->product->name}}</td>
                    <td>{{$item->quantity}}</td>
                    <td>{{$item->price * $item->quantity}} MAD</td>
                </tr>
            @endforeach
            
            <tr>
                <td colspan="3"></td>
                <td  style="font-size:15px;font-weight:bold;">prix HT : {{$order->tax}} MAD</td>
            </tr>
            <tr>
                <td colspan="3"></td>
                <td  style="font-size:15px;font-weight:bold;">Livraison :  Gratuit!</td>
            </tr>
            <tr>
                <td colspan="3"></td>
                <td style="font-size:22px;font-weight:bold;">Total : {{$order->total}} MAD</td>
            </tr>
        </tbody>
    </table>    
</body>
</html>