from flask import Flask, render_template, request
import matplotlib.pyplot
import matplotlib
matplotlib.use('Agg')
import pandas
import datetime
import pytz

utc = pytz.UTC
df = pandas.read_csv("static/data/reviews.csv", parse_dates=["Timestamp"])

def histogram():
    matplotlib.pyplot.hist(df.Rating, bins=10)
    matplotlib.pyplot.savefig('static/images/hist.png')
    return render_template("home.html", 
            name = "Histogram",
            image = 'static/images/hist.png')

def histogram2():
    matplotlib.pyplot.hist(df.Rating, bins=5)
    matplotlib.pyplot.savefig('static/images/hist2.png')
    return render_template("home.html", 
            name = "Histogram",
            image = 'static/images/hist2.png')

app = Flask(__name__)

@app.route("/", methods = ["GET", "POST"])
def home():
    if request.method == "GET":
        return render_template("home.html")
    if request.method == "POST":
        if request.form["action"]=="Histogram":
            return histogram()
    if request.method == "POST":
        if request.form["action"]=="Histogram2":
            return histogram2()

if __name__ == "__main__":
    app.run()
