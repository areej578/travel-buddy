# 🌍 Travel Package Chooser AI – AI Utility Agent for Personalized Trip Selection 

A smart, AI-powered mobile app that helps users discover the best travel destinations based on their **budget**, **trip duration**, **preferred location type**, and **region**. Developed as part of a semester-long course project in **AI + Mobile Application Development**.

---

## 🚀 Features

- 🤖 AI-based Recommendation Engine
- 🌐 Region-specific travel packages (Pakistan + Worldwide)
- ✨ Preference filter: Beach, Hills, Lakes, City
- 📱 Clean Flutter UI with carousel images and smooth transitions
- 🔄 FastAPI-based backend with real-time data fetching
- ☁️ Cloud-accessible API via Ngrok

---

## 🧰 Tech Stack

| Layer       | Technology Used                          |
|-------------|-------------------------------------------|
| Frontend    | Flutter                                   |
| Backend     | Python (FastAPI, Uvicorn)                 |
| AI Logic    | Utility-based Scoring + A\* Search        |
| Deployment  | Google Colab + Ngrok                      |
| Data Format | CSV (region-based travel datasets)        |

---

## 📂 Files Included

- `lib/` – Flutter source code (UI + API Integration)
- `travel_data.csv` – Worldwide destinations
- `pakistan_northern_travel_data.csv` – Pakistan regional data
- `ai_backend_colab.ipynb` – FastAPI backend in Google Colab

---

## 🧠 How It Works

**User Input** → Region + Budget + Days + Type Preference  
**AI Engine** → 
- If **perfect match** found → return top 5 utility matches  
- Else → apply **A\* search** to suggest closest options  
**Result** → Display travel cards with names, cost, and duration

---

## 📷 Sample Output

Screenshots from mobile and web versions show:
- Input screen with image carousel
- Dropdowns and chips for input
- Result screen showing exact or fallback matches

---

## 🎓 About the Developer

A Computer Science undergraduate with a passion for **AI**, **cloud computing**, and **cross-platform development**. Loves building real-world utility apps. Hobbies include **writing**, **cooking**, and **reading**.

---

## 🔗 References

- [Flutter](https://flutter.dev/)
- [FastAPI](https://fastapi.tiangolo.com/)
- [Ngrok](https://ngrok.com/)
- [Falticon](https://www.flaticon.com/)
- [Pinterest](https://www.pinterest.com/) – Carousel Images
- [Kaggle](https://www.kaggle.com/) – Data Inspiration

---

> 📌 Designed with care for a meaningful semester project in Artificial Intelligence & Mobile Development.
