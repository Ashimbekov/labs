package org.nurdaulet;


class ChildTicket extends Ticket {
    public ChildTicket(int ticketId, double price, Seat seat, Showtime showtime) {
        super(ticketId, price, seat, showtime, "Детский");
    }

    @Override
    public double applyDiscount(double discountPercentage) {
        return super.applyDiscount(0.3);
    }
}
