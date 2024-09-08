
// Initialise Leaflet.js map with the default view on east Sheffield
var map = L.map('map').setView([53.386111, -1.506000], 13);

// Add OpenStreetMap tiles
L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 18,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

let wildlifeLayer = L.layerGroup();

// add the geojson data for sheffield points of local natural interest
fetch('Local_Wildlife_Sites.geojson')
    .then(response => response.json())
    .then(data => {
        L.geoJSON(data).addTo(wildlifeLayer);
    })
    .catch(error => {
        console.error('Error fetching GeoJSON data:', error);
    });


// Object for the overlay layers on the map
// Layer display name : layer object
let overlayMaps = {
    "Sheffield Local Wildlife Sites": wildlifeLayer
};

// Add the leaflet controls to the map
L.control.layers(null, overlayMaps).addTo(map);


/**
 * Fetch coordinates of locations and creates markers on the map
 * Will skip caption and image accordingly if not in the database
 */

async function loadCoordinates() {
    try {
        const res = await fetch(`api/get_coordinates.php`);
        const data = await res.json();
        data.forEach(async (location) => {
            const animalList = await getAnimalsAtLocation (location.location_id);
            let content = `<h3>${location.location_name}</h3>`;
            if (location.image) {
                content += `<img src="${location.image}" class="location-picture">`;
            }
            if (location.area_caption) {
                content += `<p><i>${location.area_caption}</i></p>`;
            }
            content += animalList;

            L.marker([location.latitude, location.longitude]).addTo(map)
                .bindPopup(content);
        });
    } catch (error) {
        console.error('Error fetching coordinates:', error);
    }
}
/**
 * Fetch the animals at a given location
 * @param {number} locationId - Corresponds with locations.location_id
 * @returns {Promise<string>} - A promise that resolves to an HTML string of animal names in a bullet point list
 */
async function getAnimalsAtLocation (locationId) {
    try {
        const res = await fetch(`api/get_animals_at_location.php?location_id=${locationId}`);
        const data = await res.json();
        const animalNames = data.map(item => `<a href="./animal.html?animal_id=${item.animal_id}">${item.common_name}</a>`);

        return `<ul>${animalNames.map(name => `<li>${name}</li>`).join('')}</ul>`;
    } catch (error) {
        console.error('Error fetching animals at location:', error);
        return '<p>Awaiting pictures taken at this location</p>';
    }
}

loadCoordinates();
