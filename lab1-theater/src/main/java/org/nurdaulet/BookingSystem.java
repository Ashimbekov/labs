package org.nurdaulet;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

class BookingSystem {
    private List<Reservation> reservations;

    public BookingSystem() {
        reservations = new ArrayList<>();
    }

    public void bookTicket(Customer customer, Show show, Seat seat, Ticket ticket) {
        for (Reservation reservation : reservations) {
            if (reservation.getShow() == show && reservation.getSeat() == seat) {
                System.out.println("Ошибка: Место " + seat.getSeatDetails() + " уже забронировано.");
                return;
            }
        }

        Reservation reservation = new Reservation(customer, show, seat, ticket);
        reservations.add(reservation);
        customer.makeReservation(reservation);

        System.out.println("Билет успешно забронирован для " + customer.getName() + " на спектакль: " + show.getTitle());
        reservation.printReservationDetails();
    }

    public void showAllReservations() {
        if (reservations.isEmpty()) {
            System.out.println("Пока нет бронирований.");
        } else {
            System.out.println("Текущие бронирования:");
            for (Reservation reservation : reservations) {
                reservation.printReservationDetails();
            }
        }
    }

    public void cancelReservation(Customer customer, Show show, Seat seat) {
        for (Iterator<Reservation> iterator = reservations.iterator(); iterator.hasNext(); ) {
            Reservation reservation = iterator.next();
            if (reservation.getCustomer() == customer && reservation.getShow() == show && reservation.getSeat() == seat) {
                iterator.remove();
                customer.cancelReservation(reservation);
                System.out.println("Бронирование для " + customer.getName() + " отменено.");
                return;
            }
        }
        System.out.println("Бронирование не найдено.");
    }
}
