CREATE TABLE users (
    id uuid PRIMARY KEY,
    birth_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    psw VARCHAR(50) NOT NULL
);

INSERT INTO users (id, birth_name, surname, email, psw) VALUES 
('e61ca60e-2409-4352-99bf-827a3b0bf0d2', 'Eneko', 'Acero', 'eneko@acerosurfeskola.com', 'pass1234'),
('12de44cc-477c-4381-899a-50ad5f09eaa1', 'Txaber', 'Trojaola', 'txaber@uretansurf.com', 'uretan9876');

CREATE TABLE fin_configurations (
    id uuid PRIMARY KEY,
    config_name VARCHAR UNIQUE NOT NULL
);

INSERT INTO fin_configurations (id, config_name) VALUES 
('65e6a830-afa2-4bf4-a177-b968e21a7d49', 'single'),
('d42695df-db05-40f0-aff3-6f4bf54fce94', 'twin'),
('6db38d1d-6ee1-4574-ac6e-f5e1bc851b5e', 'thruster'),
('f68f3980-1b34-4fd1-934e-4f9e6a394fd7', 'quad'),
('7b1b011f-fc03-4761-956e-ecaf271e7746', 'tri-quad');

CREATE TABLE boards (
    id uuid PRIMARY KEY,
    length_ft NUMERIC(4, 2) NOT NULL CHECK (length_ft >= 0),
    width_inch NUMERIC(2,0) NOT NULL CHECK (width_inch >= 0),
    thickness_ft NUMERIC(4, 2) NOT NULL CHECK (thickness_ft >= 0),
    fin_configuration_id uuid,
    current_status VARCHAR NOT NULL,
    owner_id uuid,
    FOREIGN KEY (owner_id) REFERENCES users (id),
    FOREIGN KEY (fin_configuration_id) REFERENCES fin_configurations (id)
);

INSERT INTO boards ( id, length_ft, width_inch, thickness_ft, fin_configuration_id, current_status, owner_id) VALUES 
('fbea95f2-aa23-48f7-a3fa-4755024046cc', 5.10, 21, 2,  '6db38d1d-6ee1-4574-ac6e-f5e1bc851b5e','available',  'e61ca60e-2409-4352-99bf-827a3b0bf0d2'),
('25f4e40c-3e83-43c5-9516-fdd649f3a86b', 6.06, 22, 2.3,  '6db38d1d-6ee1-4574-ac6e-f5e1bc851b5e','available', 'e61ca60e-2409-4352-99bf-827a3b0bf0d2'),
('8052b935-f3db-486b-9887-b586f174ff83', 10.0, 22, 2.3,  '65e6a830-afa2-4bf4-a177-b968e21a7d49','available', '12de44cc-477c-4381-899a-50ad5f09eaa1');

CREATE TABLE rentals (
    id uuid PRIMARY KEY,
    board_id uuid,
    renter_id uuid,
    started_at timestamp NOT NULL,
    ended_at timestamp NOT NULL,
    price NUMERIC NOT NULL,
    FOREIGN KEY (board_id) REFERENCES boards (id),
    FOREIGN KEY (renter_id) REFERENCES users (id)
);

INSERT INTO rentals (id, board_id, renter_id, started_at, ended_at, price) VALUES 
('6ed22745-3aa0-4052-bfbb-1af84cf20848', '8052b935-f3db-486b-9887-b586f174ff83', 'e61ca60e-2409-4352-99bf-827a3b0bf0d2', '2024-09-28 08:00', '2024-09-28 09:00', 10);
