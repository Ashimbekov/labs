package org.nurdaulet;

class Ticket implements IPrintable, IDiscountable {
    private int ticketId;
    private double price;
    private Seat seat;
    private Showtime showtime;
    private String type;

    public Ticket(int ticketId, double price, Seat seat, Showtime showtime, String type) {
        this.ticketId = ticketId;
        this.price = price;
        this.seat = seat;
        this.showtime = showtime;
        this.type = type;
    }

    @Override
    public void print() {
        System.out.println("Билет ID: " + ticketId + ", Тип: " + type + ", Цена: " + price + ", Место: " + seat.getSeatDetails() + ", Время: " + showtime.getShowtimeDetails());
    }

    @Override
    public double applyDiscount(double discountPercentage) {
        return price * (1 - discountPercentage);
    }

    public double getPrice() {
        return price;
    }

    public String getType() {
        return type;
    }
}
