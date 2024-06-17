from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials, firestore

app = Flask(__name__)

# Initialize Firebase app
cred = credentials.Certificate("D:\\finalYearProject\\flutter-firebase-f5984-firebase-adminsdk-abqlp-5153201ac0.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

@app.route('/process_prescription', methods=['POST'])
def process_prescription():
    try:
        # Receive image file path from Flutter app
        image_path = request.form.get('image')

        # Process prescription information (dummy implementation)
        extracted_info = {
            "medicine": ["Asprin", "Piriton"],
            "dose": ["100 mg", "200 mg"],
            "patient_name": "Kavya Nishadi",
            "doctor": "Amila Perera",
        }

        # Save extracted prescription information to Firestore
        db.collection('prescriptions').add(extracted_info)

        return jsonify({"message": "Prescription information added successfully"})
    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == '__main__':
    app.run(debug=True)
