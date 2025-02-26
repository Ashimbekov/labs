package org.nurdaulet;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Show show1 = new Show("От қыз", new Showtime("2025-03-01", "19:00"), "Балет");
        Actor actor1 = new Actor("Карина Абдуллина", 25, "123-456-789", 5000, "Композитор");
        Actor actor2 = new Actor("Бахыт Каирбеков", 26, "123-456-789", 5000, "Автор либретто");
        Actor actor3 = new Actor("Мукарам Авахри", 27, "987-654-321", 5000, "Балетмейстер-постановщик");
        Actor actor4 = new Actor("Айгерим Алтыбасарова", 28, "987-654-321", 5000, "Художник-сценограф, художник по костюмам");
        Actor actor5 = new Actor("Аскар Искаков", 29, "987-654-321", 5000, "Ассистент художника-сценографа");
        Actor actor6 = new Actor("Наталья Протасова", 33, "987-654-321", 5000, "Ассистент художника по костюмам");
        Actor actor7 = new Actor("Денис Солнцев", 34, "987-654-321", 5000, "Художник по свету");
        Actor actor8 = new Actor("Нурлан Абишев", 35, "987-654-321", 5000, "Видеохудожник");
        Actor actor9 = new Actor("Арман Уразгалиев.", 36, "987-654-321", 5000, "Музыкальный руководитель постановки, дирижер");


        show1.addActor(actor1);
        show1.addActor(actor2);
        show1.addActor(actor3);
        show1.addActor(actor4);
        show1.addActor(actor5);
        show1.addActor(actor6);
        show1.addActor(actor7);
        show1.addActor(actor8);
        show1.addActor(actor9);

        Show show2 = new Show("Щелкунчик ", new Showtime("2025-02-21", "19:00"), "Балет");
        Actor actor10 = new Actor("Шугыла АДЕПХАН", 33, "987-654-321", 5000, "Мари");
        Actor actor11 = new Actor("Еркин РАХМАТУЛЛАЕВ", 33, "987-654-321", 5000, "Щелкунчик-Принц");
        Actor actor12 = new Actor("Олжас ТАРЛАНОВ", 33, "987-654-321", 5000, "Дроссельмейер");
        Actor actor13 = new Actor("Айдан КАЛЖАН", 33, "987-654-321", 5000, "Мышиный король");
        Actor actor14 = new Actor("Жанибек ИМАНКУЛОВ", 33, "987-654-321", 5000, "Штальбаум");
        Actor actor15 = new Actor("Асель КЕНЖЕБЕКОВА", 33, "987-654-321", 5000, "Его жена");
        Actor actor16 = new Actor("Назира ЗАЕТОВА", 33, "987-654-321", 5000, "Фриц");
        Actor actor17 = new Actor("Айбар ТОКТАР", 33, "987-654-321", 5000, "Щелкунчик-кукла");
        Actor actor18 = new Actor("Вега Камар ИКБАЛОВА", 33, "987-654-321", 5000, "Щелкунчик-кукла");

        show2.addActor(actor10);
        show2.addActor(actor11);
        show2.addActor(actor12);
        show2.addActor(actor13);
        show2.addActor(actor14);
        show2.addActor(actor15);
        show2.addActor(actor16);
        show2.addActor(actor17);
        show2.addActor(actor18);

        BookingSystem bookingSystem = new BookingSystem();

        Admin admin = new Admin("Админ", 40, "admin@theater.com", 10000);
        Admin admin2 = new Admin("Админ2", 44, "admin2@theater.com", 10000);
        Admin admin3 = new Admin("Админ3", 45, "admin3@theater.com", 10000);
        Admin admin4 = new Admin("Админ4", 47, "admin4@theater.com", 10000);

        List<Employee> staff = new ArrayList<>();
        staff.add(admin);
        staff.add(admin2);
        staff.add(admin3);
        staff.add(admin4);

        Customer customer = new Customer("Ашимбеков Нурдаулет", 22, "nurdaulet@gmail.com");

        List<Employee> employees = new ArrayList<>();
        employees.add(actor1);
        employees.add(actor2);
        employees.add(actor3);
        employees.add(actor4);

        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\nВыберите режим работы:");
            System.out.println("1. Клиент");
            System.out.println("2. Администратор");
            System.out.println("0. Выход");
            int mode = scanner.nextInt();
            scanner.nextLine();

            if (mode == 1) {
                System.out.println("\n--- Режим клиента ---");
                System.out.println("1. Посмотреть доступные спектакли");
                System.out.println("2. Забронировать билет");
                System.out.println("3. Посмотреть мои бронирования");
                System.out.println("4. Отменить бронирование - не работает");
                int clientChoice = scanner.nextInt();
                scanner.nextLine();

                switch (clientChoice) {
                    case 1:
                        System.out.println("Доступные спектакли:");
                        System.out.print("1. ");
                        show1.displayShowDetails();
                        System.out.println();
                        System.out.print("2. ");
                        show2.displayShowDetails();
                        break;
                    case 2:
                        System.out.println("Выберите спектакль: ");
                        int showChoice = scanner.nextInt();
                        scanner.nextLine();

                        Show chosenShow = (showChoice == 1) ? show1 : show2;

                        System.out.println("Выберите место:");
                        System.out.print("Ряд: ");
                        int row = scanner.nextInt();
                        System.out.print("Номер: ");
                        int number = scanner.nextInt();
                        Seat chosenSeat = new Seat(row, number);

                        System.out.println("Выберите тип билета (1 - Обычный, 2 - VIP, 3 - Студенческий, 4 - Детский): ");
                        int ticketType = scanner.nextInt();
                        scanner.nextLine();

                        String type;
                        switch (ticketType) {
                            case 1:
                                type = "Обычный";
                                break;
                            case 2:
                                type = "VIP";
                                break;
                            case 3:
                                type = "Студенческий";
                                break;
                            case 4:
                                type = "Детский";
                                break;
                            default:
                                type = "Обычный";
                                break;
                        }

                        Ticket ticket = TicketFactory.createTicket(1, 1000, chosenSeat, chosenShow.getShowtime(), type);
                        bookingSystem.bookTicket(customer, chosenShow, chosenSeat, ticket);
                        break;
                    case 3:
                        customer.showAllReservations();
                        break;
                    case 4:
                        System.out.println("Введите данные для отмены бронирования:");
                        System.out.print("Ряд: ");
                        int cancelRow = scanner.nextInt();
                        System.out.print("Номер: ");
                        int cancelNumber = scanner.nextInt();
                        Seat cancelSeat = new Seat(cancelRow, cancelNumber);
                        bookingSystem.cancelReservation(customer, show1, cancelSeat);
                        break;
                    default:
                        System.out.println("Неверный выбор.");
                        break;
                }
            } else if (mode == 2) {
                System.out.println("\n--- Режим администратора ---");
                System.out.println("1. Показать статистику");
                System.out.println("2. Управление сотрудниками");
                System.out.println("3. Добавить спектакль");
                System.out.println("4. Показать всех сотрудников");
                int adminChoice = scanner.nextInt();
                scanner.nextLine();

                switch (adminChoice) {
                    case 1:
                        admin.showStatistics(bookingSystem);
                        break;
                    case 2:
                        admin.manageEmployees(employees);
                        break;
                    case 3:
                        System.out.print("Введите название спектакля: ");
                        String title = scanner.nextLine();
                        System.out.print("Введите жанр: ");
                        String genre = scanner.nextLine();
                        System.out.print("Введите дату (гггг-мм-дд): ");
                        String date = scanner.nextLine();
                        System.out.print("Введите время (чч:мм): ");
                        String time = scanner.nextLine();
                        Show newShow = new Show(title, new Showtime(date, time), genre);
                        admin.addShow(bookingSystem, newShow);
                        break;
                    case 4:
                        admin.showAllEmployees(staff);
                        break;
                    default:
                        System.out.println("Неверный выбор.");
                        break;
                }
            } else if (mode == 0) {
                break;
            } else {
                System.out.println("Неверный выбор. Попробуйте снова.");
            }
        }
        scanner.close();
    }
}