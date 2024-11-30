use Shitech;



SELECT
    quadrante,-- terceira KPI --
    CASE
    WHEN MAX(umidade) - avg(umidade)  > ABS(MIN(umidade) - avg(umidade)) THEN TRUNCATE(MAX(umidade) - avg(umidade), 2) 
	WHEN MAX(umidade) - avg(umidade)  < ABS(MIN(umidade) - avg(umidade)) THEN TRUNCATE(ABS(MIN(umidade) - avg(umidade)), 2)
    ELSE TRUNCATE(MAX(umidade) - avg(umidade), 2)  END AS variacao_umidadeFINAL
FROM Dados JOIN Sensor
ON Dados.fkSensor = Sensor.idSensor
 WHERE horarioCaptura >= NOW() - interval 1 DAY
GROUP BY quadrante 
order by variacao_umidadeFINAL DESC limit 1;

INSERT INTO Dados (fkSensor, temperatura, umidade, horarioCaptura) VALUES
(2, 24.72, 43.74,convert(concat(curdate(), " ", (SEC_TO_TIME(FLOOR(TIME_TO_SEC('00:00:00') + RAND() * (TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))))))), datetime)),
(2, 24.83, 46.05,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.64, 42.84,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.4, 45.85, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.94, 60.0, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.03, 43.4, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.67, 45.6, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.55, 55.38,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.44, 42.64,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.98, 55.38,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.49, 42.22,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.33, 54.36,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.99, 48.55,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.74, 42.65,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.42, 42.5, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.28, 55.32,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.83, 56.48,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.79, 58.28,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.29, 44.29,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.26, 42.23,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.72, 45.29,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.72, 52.32,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.07, 43.26,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.38, 58.22,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.47, 46.42,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.34, 58.4, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.22, 52.67,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.34, 42.28,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.78, 43.22,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.42, 55.46,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.65, 42.86,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.78, 49.32,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.23, 44.62,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.82, 56.79,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.42, 49.29,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.22, 55.44,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.95, 45.37,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.09, 49.02,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.3, 50.08, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.68, 40.0, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.3, 58.29, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.87, 53.22,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.62, 55.93,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.8, 44.79, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.74, 56.74,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.24, 58.08,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.27, 44.46,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.93, 44.03,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.52, 53.06,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.42, 50.39,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.03, 55.62,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.76, 54.66,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.84, 45.04,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.63, 53.06,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.33, 52.6, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.82, 57.54,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.52, 56.04,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.82, 59.84,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.36, 50.27,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.32, 47.89,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.84, 54.82,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.05, 50.33,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.5, 56.36, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.78, 42.99,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.23, 53.89,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.25, 49.4, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.26, 53.64,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.28, 58.04,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.72, 57.32,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.04, 42.69,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.77, 54.93,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.86, 59.6, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.67, 43.93,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.66, 43.23,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.44, 40.7, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.28, 45.5, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.62, 58.89,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.5, 47.96, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.92, 55.82,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.37, 55.95,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.08, 50.32,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.05, 40.03,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.22, 43.3, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.73, 40.83,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.66, 42.92,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.8, 56.04, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.53, 49.98,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.38, 44.33,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.03, 42.52,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.2, 44.89, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.67, 50.04,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.93, 56.77,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.69, 50.37,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.22, 47.27,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.26, 43.98,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.39, 40.37,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.67, 53.33,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.0, 46.97, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.82, 45.29,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.22, 48.93,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.8, 44.25, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.46, 57.37,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.22, 44.47,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.02, 45.28,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.54, 45.86,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.85, 59.2, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.94, 52.65,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.62, 57.62,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.49, 50.8, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.59, 53.97,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.99, 49.87,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.87, 57.22,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.02, 54.42,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.07, 54.72,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.23, 59.2, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.36, 58.49,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.85, 47.57,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.32, 44.24,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.32, 54.37,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.54, 45.33,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.76, 43.5, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.92, 57.74,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.94, 48.78,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.25, 45.82,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.78, 50.29,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.37, 40.99,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.69, 42.25,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.38, 54.84,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.02, 56.99,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.97, 59.63,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.78, 45.35,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.73, 44.06,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.22, 40.23,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.57, 50.83,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.85, 44.92,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.78, 52.27,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.95, 44.7, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.27, 52.8, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.92, 53.04,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.9, 43.33, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.9, 53.49, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.74, 46.99,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.42, 52.68,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.93, 54.63,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.98, 45.92,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.72, 46.96,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.49, 58.99,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.7, 42.35, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.89, 55.89,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.27, 49.3, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.23, 57.06,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.58, 47.79,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.02, 43.87,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.82, 44.76,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.05, 44.29,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.04, 42.23,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.43, 56.22,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.57, 47.76,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.03, 58.06,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.05, 54.25,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.8, 52.06, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.09, 52.2, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.48, 42.38,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.83, 54.42,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.57, 52.96,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.38, 58.77,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.62, 42.78,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.29, 55.26,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.24, 55.78,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.98, 56.28,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.6, 45.46, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.82, 57.95,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.62, 45.72,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.27, 53.92,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.59, 47.7, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.57, 58.42,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.67, 45.47,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.73, 59.92,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.22, 52.84,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.97, 58.32,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.67, 55.94,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.86, 50.09,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.35, 49.92,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.02, 54.23,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.35, 44.52,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.62, 45.98,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.49, 52.3, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.85, 48.95,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.07, 47.92,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.02, 48.24,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.24, 52.02,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.9, 46.82, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.84, 47.7, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.89, 47.25,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.27, 54.75,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.33, 46.32,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.64, 42.43,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.24, 46.22,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.79, 42.29,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.38, 59.6, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.05, 57.47,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.43, 56.5, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.09, 42.64,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.36, 52.02,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.66, 45.59,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.08, 59.65,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.73, 42.53,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.5, 58.26, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.33, 45.58,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.94, 58.36,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.26, 49.82,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.58, 58.93,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.52, 52.63,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.02, 42.43,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.85, 46.46,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.65, 49.46,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.22, 46.42,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.27, 46.34,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.0, 43.95, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.65, 44.69,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.26, 46.79,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.3, 50.89, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.6, 46.22, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.36, 47.42,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.65, 52.9, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.74, 59.06,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 26.48, 48.2, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.45, 52.27,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.2, 52.28, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.66, 52.68,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.46, 50.43,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.0, 56.37, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.2, 52.89, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.55, 55.22,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.34, 52.68,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.26, 59.25,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.92, 53.65,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 23.98, 57.32,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.24, 58.49,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 27.27, 44.52,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.4, 47.52, convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.59, 56.72,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 24.46, 42.73,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.25, 44.88,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 25.28, 42.64,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.29, 45.95,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 28.24, 49.82,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 20.72, 50.29,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 29.42, 56.05,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        )),
(2, 22.96, 55.53,convert(concat(curdate(), " ", (SEC_TO_TIME(
          FLOOR(
             TIME_TO_SEC('00:00:00') + RAND() * (
                  TIME_TO_SEC(TIMEDIFF('23:59:00', '00:00:00'))
             )
          )
        ))), datetime
        
        ));
        
        select * from Dados;
        
        insert into Lotes;