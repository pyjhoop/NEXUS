const getButton = document.getElementById('get1');

const test12 = document.getElementById('test12'); 

const multiInput1 = document.getElementById('multi-input'); 

const values = document.querySelector('#values'); 

const stackInputHidden = document.querySelector('#stackInputHidden'); 










getButton.onclick = () => {
  if (multiInput1.getValues().length > 0) {
  		getButton.innerText="저장되었습니다";
  	    values.textContent = `${multiInput1.getValues().join(',')}`;
  	    stackInputHidden.textContent = `${multiInput1.getValues().join(',')}`;
  } else {
    values.textContent = 'Got noon123e  :`^(.'; 
  }
}

test12.onclick = () => {
  if (multiInput1.getValues().length > 0) {
  	    values.textContent = `${multiInput1.getValues().join(',')}`;
  } else {
    values.textContent = 'Got noon123e  :`^(.'; 
  }
}








