CREATE TYPE cart_status AS ENUM ('OPEN', 'ORDERED');

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE carts (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id uuid NOT NULL,
    created_at DATE DEFAULT CURRENT_DATE NOT NULL,
    updated_at DATE NOT NULL,
    status cart_status NOT NULL
);

CREATE TABLE cart_items (
    cart_id uuid,
    product_id uuid,
    count integer,
    FOREIGN KEY (cart_id) REFERENCES carts (id)
);

INSERT INTO carts (id, user_id, created_at, updated_at, status)
VALUES
    ('3d3e980e-3b6c-4c02-9d3e-6c141289bea7', '1c90e5f8-23d5-4229-9e43-0515d8d5c439', '2022-01-01', '2022-01-02', 'OPEN'),
    ('99c5d5f8-0874-4e6e-88bf-2574d4e4e0b9', 'f79d3e3e-ced3-4bea-84c1-5cf9056d61a9', '2022-01-02', '2022-01-02', 'ORDERED'),
    ('3b7d476d-3fb9-4b87-b09e-ee2d8e47032b', 'f79d3e3e-ced3-4bea-84c1-5cf9056d61a9', '2022-01-03', '2022-01-04', 'OPEN'),
    ('45f931bb-0d19-4a7d-aa58-0a14e20a45d8', '9fa24c5b-8145-4f5e-94e6-727c690e4a51', '2022-01-04', '2022-01-05', 'OPEN'),
    ('a6fb14af-63de-43e8-bf8d-ff6c89018ce1', '9fa24c5b-8145-4f5e-94e6-727c690e4a51', '2022-01-05', '2022-01-05', 'ORDERED'),
    ('3d3e980e-3b6c-4c02-9d3e-6c161289bea7', '9fa24c5b-8145-4f5e-94e6-727c690e4a51', '2022-01-05', '2022-01-05', 'ORDERED');

INSERT INTO cart_items (cart_id, product_id, count)
VALUES
    ('3d3e980e-3b6c-4c02-9d3e-6c141289bea7', '1c90e5f8-23d5-4229-9e43-0515d8d5c439', 3),
    ('99c5d5f8-0874-4e6e-88bf-2574d4e4e0b9', 'f79d3e3e-ced3-4bea-84c1-5cf9056d61a9', 50),
    ('3b7d476d-3fb9-4b87-b09e-ee2d8e47032b', 'f79d3e3e-ced3-4bea-84c1-5cf9056d61a9', 1),
    ('45f931bb-0d19-4a7d-aa58-0a14e20a45d8', '9fa24c5b-8145-4f5e-94e6-727c690e4a51', 177),
    ('a6fb14af-63de-43e8-bf8d-ff6c89018ce1', '9fa24c5b-8145-4f5e-94e6-727c690e4a51', 20),
    ('3d3e980e-3b6c-4c02-9d3e-6c161289bea7', '1c90e5f8-23d5-4229-9e43-0513d8d5c439', 4);
