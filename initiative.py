from flask import Flask, request, redirect, render_template

app = Flask(__name__)

@app.route('/submit', methods=['POST'])
def submit_form():
    email = request.form['email']
    title = request.form['title']
    description = request.form['description']
    tokens = request.form['tokens']
    
    with open('formdata.txt', 'a') as file:
        file.write(f"Email: {email}, Title: {title}, Description: {description}, Tokens: {tokens}\n")
    
    return render_template('EcoPosts.html', email=email, title=title, description=description, tokens=tokens)

@app.route('/')
def index():
    return render_template('EcoPosts.html')

if __name__ == '__main__':
    app.run(debug=True)