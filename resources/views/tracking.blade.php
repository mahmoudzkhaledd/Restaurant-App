<h1>Order Tracking</h1>

@if ($pendingOrders->isEmpty())
    <p>No pending orders.</p>
@else
    <table class="table">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Status</th>
                <th>Time Remaining</th>
            </tr>
        </thead>
        <tbody>
            @foreach($pendingOrders as $order)
            Order ID: {{ $order->id }}<br>
            Status: {{ $order->status }}<br>
            Time Remaining: {{ $order->timeRemaining }}<br>
            @endforeach
        
            
        </tbody>
    </table>
@endif
