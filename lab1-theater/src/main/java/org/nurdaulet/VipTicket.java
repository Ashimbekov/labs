package org.nurdaulet;

class VipTicket extends Ticket {
    private String additionalService;

    public VipTicket(int ticketId, double price, Seat seat, Showtime showtime, String additionalService) {
        super(ticketId, price, seat, showtime, "VIP");
        this.additionalService = additionalService;
    }

    @Override
    public void print() {
        super.print();
        System.out.println("Дополнительный сервис: " + additionalService);
    }
}
