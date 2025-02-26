package org.nurdaulet;

import java.util.ArrayList;
import java.util.List;

class Customer extends Person {
    private List<Reservation> reservations;

    public Customer(String name, int age, String contactInfo) {
        super(name, age, contactInfo);
        this.reservations = new ArrayList<>();
    }

    @Override
    public void showDetails() {
        System.out.println("Покупатель: " + getName() + ", Возраст: " + getAge() + ", Контакт: " + getContactInfo());
    }

    public void makeReservation(Reservation reservation) {
        reservations.add(reservation);
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void cancelReservation(Reservation reservation) {
        reservations.remove(reservation);
    }

    public void showAllReservations() {
        if (reservations.isEmpty()) {
            System.out.println("У вас нет бронирований.");
        } else {
            System.out.println("Ваши бронирования:");
            for (Reservation reservation : reservations) {
                reservation.printReservationDetails();
            }
        }
    }
}
