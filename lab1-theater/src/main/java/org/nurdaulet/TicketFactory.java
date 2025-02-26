package org.nurdaulet;

class TicketFactory {
    public static Ticket createTicket(int ticketId, double price, Seat seat, Showtime showtime, String type) {
        switch (type.toLowerCase()) {
            case "vip":
                return new VipTicket(ticketId, price, seat, showtime, "Бесплатный напиток");
            case "student":
                return new StudentTicket(ticketId, price, seat, showtime);
            case "child":
                return new ChildTicket(ticketId, price, seat, showtime);
            default:
                return new Ticket(ticketId, price, seat, showtime, "Обычный");
        }
    }
}
