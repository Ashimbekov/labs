package org.nurdaulet;

import java.util.ArrayList;
import java.util.List;

class Show {
    private String title;
    private List<Actor> actors;
    private Showtime showtime;
    private String genre;

    public Show(String title, Showtime showtime, String genre) {
        this.title = title;
        this.showtime = showtime;
        this.genre = genre;
        this.actors = new ArrayList<>();
    }

    public void addActor(Actor actor) {
        actors.add(actor);
    }

    public String getTitle() {
        return title;
    }

    public void displayShowDetails() {
        System.out.println("Спектакль: " + title + ", Жанр: " + genre + ", Время: " + showtime.getShowtimeDetails());
        for (Actor actor : actors) {
            actor.showDetails();
        }
    }

    public Showtime getShowtime() {
        return showtime;
    }

    public String getGenre() {
        return genre;
    }
}
