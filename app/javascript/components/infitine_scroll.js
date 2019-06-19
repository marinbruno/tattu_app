import InfiniteScroll from 'infinite-scroll';

const infScrollInit = () => {
  const loadButton = document.querySelector(".scroll-load-button");

  if(loadButton) {
    const loadButtonHref = loadButton.getAttribute("href");
    const loadPath = loadButtonHref.substring(0, loadButtonHref.length - 1);

    const nextPage = () => {
      const loadButtonHref = loadButton.getAttribute("href");
      return parseInt(loadButtonHref.substring(loadButtonHref.length - 1, loadButtonHref.length));
    }

    const checkLoader = (event) => {
      const documentHeight = document.body.scrollHeight;
      const bottomDistanceFromTop = window.innerHeight + window.scrollY;
      const distanceFromBottom = documentHeight - bottomDistanceFromTop;

      const loadThreshold = 300;
      const should_load = distanceFromBottom < loadThreshold;

      if(should_load) {
        window.removeEventListener("scroll", checkLoader);

        var docParser = new DOMParser();
        fetch(loadButton.getAttribute("href"))
          .then(response => response.text())
          .then(data => {
            loadButton.setAttribute("href", `${loadPath}${nextPage() + 1}`)
            const dom = docParser.parseFromString(data, "text/html");
            const items = dom.querySelectorAll(".tattoo-relative");
            console.log(items)
            if(items.length === 0) {
              throw Error("No more tattoos")
            } else {
              window.colc.append(items);
              // setTimeout(() => {
              //   items.forEach((item) => {
              //     item.classList.remove("pending-insert");
              //   })
              // }, 500);
              window.addEventListener("scroll", checkLoader);
            }
          }).catch((data) => {
            console.log(data)
          });
      };
    };

    window.addEventListener("scroll", checkLoader)
  }
}


export { infScrollInit };
