package org.nurdaulet;

class Seat {
    private int row;
    private int number;

    public Seat(int row, int number) {
        this.row = row;
        this.number = number;
    }

    public String getSeatDetails() {
        return "Ряд: " + row + ", Номер: " + number;
    }
}
