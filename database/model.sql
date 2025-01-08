


-- Crie essa tabela para registrar o histórico


CREATE TABLE facs_farm_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    org_name varchar(100) not null,
    item_name VARCHAR(50) NOT NULL,
    amount INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY(user_id, item_name, date)
);


CREATE TABLE facs_farm_config (
    id INT AUTO_INCREMENT PRIMARY KEY,
    org_name VARCHAR(100) NOT NULL,
    daily_goal INT NOT NULL,
    payment_value DECIMAL(10,2) NOT NULL,
    UNIQUE KEY(org_name)
);

