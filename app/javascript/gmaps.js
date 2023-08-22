

// Initialize and add the map
let gmap;
console.log("inn2")
async function initMap() {
  console.log("inn2")
  // The location of Uluru
  // const position = { lat: -25.344, lng: 131.031 };
  const position = { lat: 34.900, lng: 135.100 }; //兵庫　８
  // const position = { lat: 43.000, lng: 141.200 }; //北海道　６
  // const position = { lat: 35.550, lng: 139.500 }; //東京　9
  // Request needed libraries.
  //@ts-ignore
  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerView } = await google.maps.importLibrary("marker");

  console.log(`AdvancedMarkerView=${AdvancedMarkerView}`)
  // The map, centered at Uluru
  gmap = new Map(document.getElementById("gmap"), {
    zoom: 8,
    center: position,
    mapId: "DEMO_MAP_ID",
  });

  // The marker, positioned at Uluru
  const marker = new AdvancedMarkerView({
    map: gmap,
    position: position,
    title: "Uluru",
  });
}

initMap();

