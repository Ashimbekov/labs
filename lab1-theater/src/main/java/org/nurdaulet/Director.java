package org.nurdaulet;

class Director extends Employee {
    private String department;

    public Director(String name, int age, String contactInfo, double salary, String department) {
        super(name, age, contactInfo, salary);
        this.department = department;
    }

    @Override
    public void work() {
        System.out.println(getName() + " управляет отделом " + department);
    }

    @Override
    public void showDetails() {
        System.out.println("Режиссер: " + getName() + ", Возраст: " + getAge() + ", Отдел: " + department);
    }
}
