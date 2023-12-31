function Slider(target, type) {
    // 상태
    let index = 1;
    let isMoved = true;
    const speed = 1000; // ms

    // 방향
    const transform = "transform " + speed / 1000 + "s";
    let translate = (i) => "translateX(-" + 100 * i + "%)";
    if (type === "V") {
        translate = (i) => "translateY(-" + 100 * i + "%)";
    }

    // 슬라이더
    const slider = document.querySelector(target);
    const sliderRects = slider.getClientRects()[0];
    slider.style["overflow"] = "hidden";

    // 슬라이더 화면 컨테이너
    const container = document.createElement("div");
    container.style["display"] = "flex";
    container.style["flex-direction"] = type === "V" ? "column" : "row";
    container.style["width"] = sliderRects.width + "px";
    container.style["height"] = sliderRects.height + "px";
    container.style["transform"] = translate(index);

    // 슬라이더 화면 목록
    let boxes = [].slice.call(slider.children);
    boxes = [].concat(boxes[boxes.length - 1], boxes, boxes[0]);

    // 슬라이더 화면 스타일
    const size = boxes.length;
    for (let i = 0; i < size; i++) {
        const box = boxes[i];
        box.style["flex"] = "none";
        box.style["flex-wrap"] = "wrap";
        box.style["height"] = "100%";
        box.style["width"] = "100%";
        container.appendChild(box.cloneNode(true));
    }

    // 처음/마지막 화면 눈속임 이벤트
    container.addEventListener("transitionstart", function () {
        isMoved = false;
        setTimeout(() => {
            isMoved = true;
        }, speed);
    });
    container.addEventListener("transitionend", function () {
        // 처음으로 순간이동
        if (index === size - 1) {
            index = 1;
            container.style["transition"] = "none";
            container.style["transform"] = translate(index);
        }
        // 끝으로 순간이동
        if (index === 0) {
            index = size - 2;
            container.style["transition"] = "none";
            container.style["transform"] = translate(index);
        }
    });

    // 슬라이더 붙이기
    slider.innerHTML = "";
    slider.appendChild(container);

    return {
        move: function (i) {
            if (isMoved === true) {
                index = i;
                container.style["transition"] = transform;
                container.style["transform"] = translate(index);
            }
        },
        next: function () {
            if (isMoved === true) {
                index = (index + 1) % size;
                container.style["transition"] = transform;
                container.style["transform"] = translate(index);
            }
        },
        prev: function () {
            if (isMoved === true) {
                index = index === 0 ? index + size : index;
                index = (index - 1) % size;
                container.style["transition"] = transform;
                container.style["transform"] = translate(index);
            }
        }
    };
}

//슬라이더 작동을 위한 코드
window.addEventListener("DOMContentLoaded", function () {
    const s1 = new Slider("#slider1", "H");

    let intervalId = setInterval(() => {
        s1.next();
    }, 1000);

    const sliderContainer = document.querySelector("#slider1");

    sliderContainer.addEventListener("mouseenter", function () {
        clearInterval(intervalId);
    });

    sliderContainer.addEventListener("mouseleave", function () {
        intervalId = setInterval(() => {
            s1.next();
        }, 3000);
    });
});
// 슬라이더 코드는 이전과 동일합니다

window.addEventListener("DOMContentLoaded", function () {
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");

    // Initialize the slider
    const s1 = new Slider("#slider1", "H");

    prevBtn.addEventListener("click", function () {
        s1.prev();
    });

    nextBtn.addEventListener("click", function () {
        s1.next();
    });
});
