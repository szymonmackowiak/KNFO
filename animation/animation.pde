import gifAnimation.*;

import processing.data.JSONObject;
import processing.data.JSONArray;



JSONArray[] bodies;  // Tablica na trajektorie wszystkich ciał
int index = 0;       // Aktualna klatka animacji
int numBodies = 0;   // Liczba ciał

void setup() {
  size(800, 800);
  background(255);
  
  JSONObject json = loadJSONObject("bodies_data.json");
  JSONArray jsonBodies = json.getJSONArray("bodies");

  numBodies = jsonBodies.size();
  bodies = new JSONArray[numBodies];

  for (int i = 0; i < numBodies; i++) {
    bodies[i] = jsonBodies.getJSONArray(i);
  }

  frameRate(60);
}

void draw() {
  background(0);
  fill(0);
  noStroke();

  for (int i = 0; i < numBodies; i++) {
    if (index < bodies[i].size()) {
      JSONArray pos = bodies[i].getJSONArray(index);
      float x = pos.getFloat(0) * 100 + width / 2;  // skalowanie i centrowanie
      float y = pos.getFloat(1) * 100 + height / 2;
      fill(i * 100, 50, 255 - i * 100);
      ellipse(x, y, 30, 30);
    }
  }

  index++;
  if (index >= bodies[0].size()) {
    noLoop(); // zatrzymaj animację po zakończeniu
  }
}
