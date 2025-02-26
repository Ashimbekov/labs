package org.nurdaulet;

class StudentTicket extends Ticket {
    public StudentTicket(int ticketId, double price, Seat seat, Showtime showtime) {
        super(ticketId, price, seat, showtime, "Студенческий");
    }

    @Override
    public double applyDiscount(double discountPercentage) {
        return super.applyDiscount(0.5);
    }
}
