package org.nurdaulet;

class PosterFactory {
    public static Poster createPoster(Show show, String description) {
        return new Poster(show, description);
    }
}
