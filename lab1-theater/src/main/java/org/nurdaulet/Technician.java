package org.nurdaulet;

class Technician extends Employee {
    private String specialization;

    public Technician(String name, int age, String contactInfo, double salary, String specialization) {
        super(name, age, contactInfo, salary);
        this.specialization = specialization;
    }

    @Override
    public void work() {
        System.out.println(getName() + " работает как техник по " + specialization);
    }

    @Override
    public void showDetails() {
        System.out.println("Техник: " + getName() + ", Возраст: " + getAge() + ", Специализация: " + specialization);
    }
}
