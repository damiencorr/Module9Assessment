from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine

from flask import Flask, jsonify

engine = create_engine("sqlite:///titanic.sqlite")
Base = automap_base()
Base.prepare(engine, reflect=True)

Passenger = Base.classes.passenger

app = Flask(__name__)

@app.route("/")
def welcome():
   """List all available api routes."""
   return (
       f"Available Routes:<br/>"
       f"/api/v1.0/names<br/>"
       f"/api/v1.0/passengers"
   )

@app.route("/api/v1.0/names")
def names():
   """Return a list of all passenger names"""
   # Query all passengers
   session = Session(engine)
   results = session.query(Passenger.name).all()

   # Convert list of tuples into normal list
   all_names = list(np.ravel(results))

   return jsonify(results)

@app.route("/api/v1.0/passengers")
def passengers():
   """Return a list of passenger data including the name, age, and sex of each passenger"""
   # Query all passengers
   session = Session(engine)
   results = session.query(Passenger.name, Passenger.age, Passenger.sex).all()

   # Create a dictionary from the row data and append to a list of all_passengers
   all_passengers = []
   for name, age, sex in results:
       passenger_dict = {}
       passenger_dict["name"] = name
       passenger_dict["age"] = age
       passenger_dict["sex"] = sex
       all_passengers.append(passenger_dict)

   ### Return list of all passenger data in JSON format ###
   return jsonify(all_passengers)

if __name__ == '__main__':
   app.run(debug=True)