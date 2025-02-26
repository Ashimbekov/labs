package org.nurdaulet;

class Reservation {
    private Customer customer;
    private Show show;
    private Seat seat;
    private Ticket ticket;

    public Reservation(Customer customer, Show show, Seat seat, Ticket ticket) {
        this.customer = customer;
        this.show = show;
        this.seat = seat;
        this.ticket = ticket;
    }

    public Customer getCustomer() {
        return customer;
    }

    public Show getShow() {
        return show;
    }

    public Seat getSeat() {
        return seat;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void printReservationDetails() {
        System.out.println("Бронирование для: " + customer.getName() + ", Спектакль: " + show.getTitle() + ", Место: " + seat.getSeatDetails() + ", Тип билета: " + ticket.getType());
    }
}
