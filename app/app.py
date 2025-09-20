from flask import Flask, request, jsonify

app = Flask(__name__)

expenses = []

@app.route('/expenses', methods=['GET'])
def get_expenses():
    return jsonify(expenses)

@app.route('/expenses', methods=['POST'])
def add_expense():
    data = request.get_json()
    expenses.append({
        "amount": data.get("amount"),
        "description": data.get("description"),
        "date": data.get("date")
    })
    return jsonify({"message": "Expense added"}), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
