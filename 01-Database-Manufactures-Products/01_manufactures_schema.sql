-- DATABASE https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store

-- CRIANDO TABELAS - COMANDOS DDL - DATA MANIPULATION LANGUAGE
CREATE TABLE MANUFACTURERS(
    MCODE INTEGER NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    CONSTRAINT MANUFACTURERS_PK PRIMARY KEY (MCODE)
);

-- ALTER TABLE VENDEDORES
-- RENAME COLUMN DATA_ADMISSAOAO TO DATA_ADMISSAO;

CREATE TABLE PRODUCTS(
    PCODE INTEGER NOT NULL,
    NAME VARCHAR(50) NOT NULL,
    PRICE FLOAT NOT NULL,
    MANUFACTURER INTEGER NOT NULL,
    CONSTRAINT PRODUCTS_PK PRIMARY KEY (PCODE),
    CONSTRAINT FK_MANUFACTURERS_CODE REFERENCES MANUFACTURERS(MCODE)
);


