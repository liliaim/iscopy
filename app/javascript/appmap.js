console.log("inn")
const map = "../assets/map-full.svg" // Or "./map-mobile.svg"
const container = document.querySelector( '#map' )

const res = await fetch( map )
console.log(`container=${container}`)
console.log(`res=${res}`)

if ( res.ok ) {
  const svg = await res.text()
  // console.log(`svg=${svg}`)

  container.innerHTML = svg
  const prefs = document.querySelectorAll( '.geolonia-svg-map .prefecture' )

  prefs.forEach( ( pref ) => {
    // マウスオーバーで色を変える
    pref.addEventListener( 'mouseover', ( event ) => {
      event.currentTarget.style.fill = "#00ff00"
    } )

    // マウスが離れたら色をもとに戻す
    pref.addEventListener( 'mouseleave', ( event ) => {
      event.currentTarget.style.fill = ""
    } )

    // マウスクリック時のイベント
    pref.addEventListener( 'click', ( event ) => {
      console.log(`location.host=${location.host}`)
      console.log(`location.pathname=${location.pathname}`)

      // location.href = `https://example.com/${event.currentTarget.dataset.code}` // 例（大阪）: https://example.com/27
      location.href = `http://${location.host}/show/${event.currentTarget.dataset.code}` // 例（大阪）: https://example.com/27
    } )
  } )
}