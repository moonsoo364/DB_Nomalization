# Normalization

## 제 1정규화

: 주어진 테이블의 모든 속성(컬럼)이 원자값을 가져야 한다. 컬럼은 더 이상 나눌 수 없는 값을 가져야 하며 반복적인 그룹이나 배열 형태의 데이터는 허용하지 않는다.

### 1정규형 특정

1. 원자성(Atomicity) : 각 컬럼의 값이 원자 값이어야 하며, 여러 값이 결합된 형태 (예: 콤마로 구분된 값)은 허용되지 않는다.
2. 컬럼의 무결성(Column Intergrity) : 각 열의 데이터 타입이 명확히 정의되어 있어야 하고(예: 키는 숫자로 명시 돼야 하며  170 ~ 180 라는 범위로 데이터를 넣지 않는다.)각 열의 같은 타입의 데이터를 가져야 한다.
3. 행의 무결성(Row Integrity) :  각 행은 유일하게 식별될 수 있어야 하며, 이를 위해 기본 키를 사용해 고유성을 유지한다.

### Practice

1. 비정규형 테이블 (Non-Normalized Table)
: 아래와 같이 고객과 주문 정보를 하나의 테이블에 저장한다고 가정한다.

```sql
CREATE TABLE OREDERS (
	ORDER_ID INT,
	CUSTOMER_NAME VARCHAR(100),
	PRODUCT_1 VARCHAR(100),
	PRODUCT_2 VARCHAR(100),
	PRODUCT_3 VARCHAR(100),
	ORDER_DATE DATE
)
```

여기서 `PRODUCT_1` , `PRODUCT_2` , `PRODUCT_3` 은 여러 개의  상품을 저장하기 위해 사용된 열 입니다. 하지만 이 구조는 1 정규형을 따르지 않습니다. `PRODUCT_2` , `PRODUCT_3`  와 같은 열을 사용하는 것은 원자성을 위배하고, 새로운 제품을 추가할 때 열을 추가해야 하는 등 문제를 초래합니다.

1. 1정규형 테이블 (Nomalized Table)
: 1 정규형을 적용하기 위해서는 테이블의 구조를 변경하여 각 컬럼이 원자값만을 포함 하도록 해야 합니다. 이를 위해 두 개의 테이블을 분리할 수 있습니다.

```sql
CREATE TABLE CUSTOMERS (
	CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
	CUSTOMER_NAME VARCHAR(100)
);

CREATE TABLE ORDERS (
	ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
	CUSTOMER_ID INT,
	ORDER_DATE DATE,
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

CREATE TABLE ORDER_TIMES(
	ORDER_ITEM_ID INT AUTO_INCREMENT PRIMARY KEY,
	ORDER_ID INT,
	PRODUCT_NAME VARCHER(100),
	FOREIGN KEY (ORDER_ID) REFERENCE ORDERS(ORDER_ID)
);
```

위 테이블에서

- `CUSTOMERS` : 고객 정보를 저장합니다.
- `ORDERS` : 각 주문의 기본 정보를 저장합니다.
- `ORDER_ITEMS` : 테이블은 각 주문에 대한 제품 정보를 저장합니다.

각 제품의 정보는 `ORDER_ITEMS` 테이블의 별도 행으로 저장되며, 이로 인해 데이터 중복이 줄어들고 원자성을 유지할 수 있습니다.