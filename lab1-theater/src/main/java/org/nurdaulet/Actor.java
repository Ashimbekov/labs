package org.nurdaulet;

class Actor extends Employee {
    private String role;

    public Actor(String name, int age, String contactInfo, double salary, String role) {
        super(name, age, contactInfo, salary);
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    @Override
    public void work() {
        System.out.println(getName() + " исполняет роль " + role);
    }

    @Override
    public void showDetails() {
        System.out.println("Актер: " + getName() + ", Возраст: " + getAge() + ", Роль: " + role);
    }
}
