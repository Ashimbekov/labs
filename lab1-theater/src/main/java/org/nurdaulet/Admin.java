package org.nurdaulet;

import java.util.List;

class Admin extends Employee {

    public Admin(String name, int age, String contactInfo, double salary) {
        super(name, age, contactInfo, salary);
    }

    @Override
    public void work() {
        System.out.println(getName() + " работает как администратор.");
    }

    @Override
    public void showDetails() {
        System.out.println("Администратор: " + getName() + ", Возраст: " + getAge());
    }

    public void showStatistics(BookingSystem bookingSystem) {
        System.out.println("\n--- Статистика ---");
        bookingSystem.showAllReservations();
    }

    public void addShow(BookingSystem bookingSystem, Show show) {
        System.out.println("Спектакль " + show.getTitle() + " добавлен.");
    }

    public void manageEmployees(List<Employee> employees) {
        System.out.println("\n--- Управление сотрудниками ---");
        for (Employee employee : employees) {
            employee.showDetails();
        }
    }

    public void showAllEmployees(List<Employee> employees) {
        System.out.println("\n--- Список всех сотрудников ---");
        if (employees.isEmpty()) {
            System.out.println("Сотрудников нет.");
        } else {
            for (Employee employee : employees) {
                employee.showDetails();
            }
        }
    }
}
