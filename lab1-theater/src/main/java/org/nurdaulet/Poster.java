package org.nurdaulet;

class Poster {
    private Show show;
    private String description;

    public Poster(Show show, String description) {
        this.show = show;
        this.description = description;
    }

    public void displayPoster() {
        System.out.println("Афиша для спектакля: " + show.getTitle());
        System.out.println("Описание: " + description);
        System.out.println("Время показа: " + show.getShowtime().getShowtimeDetails());
        System.out.println("Жанр: " + show.getGenre());
    }
}
