from sqlalchemy import Column, Integer, String, DateTime
from sqlalchemy.orm import declarative_base

Base = declarative_base()

class Order(Base):
    __tablename__ = 'orders'

    date_uuid = Column(DateTime)
    user_id = Column(Integer, primary_key=True)
    card_number = Column(String)
    store_code = Column(String)
    product_code = Column(String)
    product_quantity = Column(Integer)
    order_date = Column(DateTime)
    shipping_date = Column(DateTime)
    delivery_date = Column(DateTime)
