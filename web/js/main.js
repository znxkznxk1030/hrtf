/**
 * Created by znxkz on 2017-05-21.
 */
window.onload = function () {

    var intervalID;
    var audioElement, panner, masterGain;
    var pattern = 1, speed = 0.05;
    var t = 0;

	initAudio();
	animate();

	function animate(){
		update();

	}


	function initAudio(){
        // initialize Audio Context
        try {
            var audioContext = new (window.AudioContext || window.webkitAudioContext)();
        }
        catch (e) {
            alert("Web Audio API is not supported in this browser");
        }

        // load hrir to the container
        var hrtfContainer = new HRTFContainer();
        hrtfContainer.loadHrir("../hrir/kemar_L.bin");


        // create audio source node from the <audio> element
        var sourceNode = audioContext.createMediaElementSource(document.getElementById("player"));
        var gain = audioContext.createGain();
        gain.gain.value = 0.6;
        sourceNode.connect(gain);

        // create new hrtf panner, source node gets connected automatically
        panner = new HRTFPanner(audioContext, gain, hrtfContainer);

        // connect the panner to the destination node
        panner.connect(audioContext.destination);
        setInterval(updatePanner, 50);
        sourceNode.play();

	}


	function update(){
        animateSource();
	}

    function updatePanner() {

		var x,y,z;

		x = Math.sin(t) * Math.cos(t);
		y = Math.cos(t) * Math.cos(t);
		z = Math.sin(t);

        var cords = cartesianToInteraural(x, y, z);
        panner.update(cords.azm, cords.elv);

        t += speed;
    }

}