class Mutant {
    constructor() {

    }
    isMutant(arra) {

        var mysql = require('mysql');

        var conexion= mysql.createConnection({
            host : 'localhost',
            database : 'adn',
            user : 'harry',
            password : 'carajo',
        });        
        conexion.connect(function(err) {
            if (err) {
                console.error('Error de conexion: ' + err.stack);
                return;
            }
           // console.log('Conectado con el identificador ' + conexion.threadId);
        });
        var acu2 = "";        
        var encontrado = [];
        var cantidad = 0;
        var coincide = ["AAAA", "TTTT", "CCCC", "GGGG"];
        
        for (var i = 0; i < arra.length; i++) {
            var elimina = 0;
            //recorro array como llega y busco coincidencias acumulo un contador por cada coincidencia y guardo en array con dna detectados
            for (var p = 0; p < 4; p++) {
                if (arra[i].includes(coincide[p])) {
                    cantidad++;
                    elimina = i;
                    encontrado.push(arra[i]);
                }
            }
            
            //tomo los primeros caracteres y los que siguen de cada elemento y 
            //vuelvo a concatenarlos en un nuevo string
            var acu = "";
            for (var b = 0; b < arra[i].length; b++) {
                acu += arra[b][i];
            }
            //busco coincidencias con el nuevo string si imprimimos por consola la var acu vemos 
            //q se reacomodo y vuelvo a acumular si hay coincidencia y guardo en array con dna detectados
            for (p = 0; p < 4; p++) {
                if (acu.includes(coincide[p])) {
                    encontrado.push(acu);
                    cantidad++;
                }
            }

            //cargo la diagonal
            acu2 += arra[i][i];

        }
        //busco coincidencias de la diagonal si encuentra suma y agrego en array con dna detectados
        for (p = 0; p < 4; p++) {
            if (acu2.includes(coincide[p])) {
                encontrado.push(acu2);
                cantidad++;
            }
        }
        //aca inserto en db dna encontrados insert ignore para q la base no repita un dna
        for(var r=0;r<=encontrado.length;r++){
        conexion.query('insert ignore into dna (dna,idTipoDna) values (\"'+encontrado[r]+'\",2);', function (error, results, fields) {
            if (error)
                throw error;        
           /* results.forEach(result => {
                console.log(result);
            });*/
            //conexion.end();
        });
    }
    //inserto los humanos
    for(var r=0;r<=arra.length;r++){
        conexion.query('insert ignore into dna (dna,idTipoDna) values (\"'+arra[r]+'\",1);', function (error, results, fields) {
            if (error)
                throw error;        
           /* results.forEach(result => {
                console.log(result);
            });*/
            //conexion.end();
        });
    }
    conexion.end();
   // console.log(humanos);
       // conectar.consultar("a");
        if (cantidad >= 2) {
            return true;
        } else {
            return false;
        }
    }
}

module.exports = Mutant;