// api.js
const API_URL = '/api/';

export async function getAnimals() {
  const response = await fetch(`${API_URL}/animals`);
  const data = await response.json();
  return data;
}
getAnimals().then(animals => {
    animals.forEach(animal => {
      const div = document.createElement('div');
      div.textContent = `Name: ${animal.name}, Species: ${animal.species}`;
      document.body.appendChild(div);
    });
  });