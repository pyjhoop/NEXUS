
// title 닉네임 or 이름이 튤립 토글로 출력되게 하는 코드
const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
});


const wrapper = document.querySelector('.wrapper');
const select = document.querySelector('.select');
const options = document.querySelector('.options');
const input = document.querySelector('.filter');//input element 

let countries =
    ["가나", "가봉", "감비아", "과테말라", "그레나다", "그리스", "기니", "네덜란드", "대한민국"];

select.addEventListener('click', function () {
    let c = wrapper.className;
    wrapper.classList.toggle('active');
});

input.addEventListener('keyup', function () {//input에 글자를 적을 때마다 event발생.
    let arr = [];//사용자가 적은 값과 일치하는 국가명을 집어넣을 새로운 배열.
    let searchWord = input.value;//사용자 입력값

    if (searchWord.length > 0) {//사용자 입력값이 존재하는 경우

        arr = countries.filter(data => { //filter메서드를 사용해서 arr로 보내는데 
            return data.startsWith(searchWord);
        }).map(data => `<li onclick="changeClickedName(this)">${data}</li>`).join("");
        //map을 사용해서 데이터를 <li>태그로 감싼 것처럼 처리함.
        //join함수를 사용해서 새배열(arr)에서 출력되는','를 없앰
        options.innerHTML = arr ? arr : '<p>조회된 나라가 없습니다.</p>';
        //조회되는 아이템이 없는 경우 보여주는 글귀 설정.
    } else {
        //사용자 입력값이 존재하지않는 경우
        options.innerHTML = "";//조회아이템이 없는 경우 보여주는 태그 비워주고
        addLi();//모든 국가명 보여주기
    }


});//input keyup event.

addLi();

function addLi() {
    countries.forEach(country => {
        let li = `<li onclick="changeClickedName(this)">${country}</li>`;
        options.insertAdjacentHTML("beforeend", li);
    })
}

function changeClickedName(li) {//옵션(국가명) 선택시
    input.value = "";//input 초기화.
    addLi();//모든 국가명 보여주기
    wrapper.classList.remove('active');//classList사용해서 active 클래스명 삭제. 
    select.firstElementChild.innerText = li.innerText;//선택된 옵션 값이 선택영역에 적용되도록 함
}