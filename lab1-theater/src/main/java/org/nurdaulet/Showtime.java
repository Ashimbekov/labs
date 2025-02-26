package org.nurdaulet;

class Showtime {
    private String date;
    private String time;

    public Showtime(String date, String time) {
        this.date = date;
        this.time = time;
    }

    public String getShowtimeDetails() {
        return "Дата: " + date + ", Время: " + time;
    }
}
