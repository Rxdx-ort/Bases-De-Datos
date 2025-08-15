CREATE DATABASE DingGoDB;

USE DingGoDB;
GO

CREATE TABLE dbo.usuarios(
  id_usuario           INT IDENTITY(1,1) PRIMARY KEY,
  correo               NVARCHAR(255) NOT NULL UNIQUE,
  hash_contraseña      VARBINARY(256) NOT NULL,                
  nombre_mostrar       NVARCHAR(120) NULL,
  foto_url             NVARCHAR(500) NULL,
  zona_horaria         NVARCHAR(64)  NULL,
  idioma               NVARCHAR(10)  NULL,
  fecha_creacion       DATETIME2(3)   NOT NULL CONSTRAINT DF_usuarios_fecha_creacion DEFAULT SYSUTCDATETIME(),
  estado               NVARCHAR(20)   NOT NULL CONSTRAINT DF_usuarios_estado DEFAULT N'activo' 
);
GO


CREATE TABLE dbo.config_usuarios(
  id_usuario                 INT PRIMARY KEY,
  formato_24h                BIT          NOT NULL CONSTRAINT DF_cfg_24h DEFAULT(1),
  tema                       NVARCHAR(16) NOT NULL CONSTRAINT DF_cfg_tema DEFAULT N'oscuro', 
  preferencias_accesibilidad NVARCHAR(MAX) NULL,
  minutos_snooze_defecto     TINYINT      NOT NULL CONSTRAINT DF_cfg_snooze DEFAULT(5),
  vibrar_defecto             BIT          NOT NULL CONSTRAINT DF_cfg_vibrar DEFAULT(1),
  CONSTRAINT FK_cfg_usuario FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario)
);
GO


CREATE TABLE dbo.dispositivos(
  id_dispositivo  INT IDENTITY(1,1) PRIMARY KEY,
  id_usuario      INT NOT NULL,
  plataforma      NVARCHAR(20) NOT NULL,   
  version_os      NVARCHAR(50) NULL,
  modelo          NVARCHAR(120) NULL,
  token_push      NVARCHAR(512) NULL,
  ultimo_acceso   DATETIME2(3) NULL,
  CONSTRAINT FK_dispo_usuario FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario)
);
GO



CREATE TABLE dbo.amistades(
  id_usuario     INT NOT NULL,
  id_amigo       INT NOT NULL,
  estado         NVARCHAR(16) NOT NULL, 
  fecha_solicitud DATETIME2(3) NOT NULL CONSTRAINT DF_amistad_solic DEFAULT SYSUTCDATETIME(),
  fecha_respuesta DATETIME2(3) NULL,
  CONSTRAINT PK_amistades PRIMARY KEY(id_usuario, id_amigo),
  CONSTRAINT FK_amistad_user  FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT FK_amistad_amigo FOREIGN KEY(id_amigo)   REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT CK_amistad_no_self CHECK (id_usuario <> id_amigo)
);
GO


CREATE TABLE dbo.rachas(
  id_usuario           INT NOT NULL,
  tipo                 NVARCHAR(40) NOT NULL, 
  racha_actual_dias    INT NOT NULL CONSTRAINT DF_racha_actual DEFAULT(0),
  racha_maxima_dias    INT NOT NULL CONSTRAINT DF_racha_max    DEFAULT(0),
  ultima_fecha_exito   DATE NULL,
  CONSTRAINT PK_rachas PRIMARY KEY(id_usuario, tipo),
  CONSTRAINT FK_rachas_usuario FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario)
);
GO


CREATE TABLE dbo.historial_rachas(
  id_usuario INT NOT NULL,
  fecha      DATE NOT NULL,
  tipo       NVARCHAR(40) NOT NULL,
  exito      BIT NOT NULL,
  CONSTRAINT PK_hist_rachas PRIMARY KEY(id_usuario, fecha, tipo),
  CONSTRAINT FK_hist_rachas_usuario FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario)
);
GO



CREATE TABLE dbo.sonidos(
  id_sonido             INT IDENTITY(1,1) PRIMARY KEY,
  nombre                NVARCHAR(120) NOT NULL,
  uri                   NVARCHAR(500) NOT NULL,
  duracion_seg          INT NULL,
  es_predeterminado     BIT NOT NULL CONSTRAINT DF_sonido_pred DEFAULT(1),
  id_usuario_propietario INT NULL, 
  CONSTRAINT FK_sonido_owner FOREIGN KEY(id_usuario_propietario) REFERENCES dbo.usuarios(id_usuario)
);
GO


CREATE UNIQUE INDEX UX_sonido_owner_nombre
  ON dbo.sonidos(id_usuario_propietario, nombre)
  WHERE id_usuario_propietario IS NOT NULL;
GO

-- alarmas
CREATE TABLE dbo.alarmas(
  id_alarma              INT IDENTITY(1,1) PRIMARY KEY,
  id_usuario             INT NOT NULL,
  etiqueta               NVARCHAR(100) NULL,
  activa                 BIT NOT NULL CONSTRAINT DF_alarma_activa DEFAULT(1),
  id_sonido              INT NULL,
  volumen                TINYINT NOT NULL CONSTRAINT DF_alarma_vol DEFAULT(80),
  vibrar                 BIT NOT NULL CONSTRAINT DF_alarma_vibrar DEFAULT(1),
  limite_snooze          TINYINT NOT NULL CONSTRAINT DF_alarma_lim_snooze DEFAULT(3),
  intervalo_snooze_min   TINYINT NOT NULL CONSTRAINT DF_alarma_int_snooze DEFAULT(5),
  zona_horaria           NVARCHAR(64) NULL,
  fecha_creacion         DATETIME2(3) NOT NULL CONSTRAINT DF_alarma_crea DEFAULT SYSUTCDATETIME(),
  fecha_actualizacion    DATETIME2(3) NOT NULL CONSTRAINT DF_alarma_upd  DEFAULT SYSUTCDATETIME(),
  CONSTRAINT FK_alarma_usuario FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT FK_alarma_sonido  FOREIGN KEY(id_sonido)  REFERENCES dbo.sonidos(id_sonido),
  CONSTRAINT CK_alarma_vol CHECK (volumen BETWEEN 0 AND 100)
);
GO


CREATE TABLE dbo.horarios_alarma(
  id_horario     INT IDENTITY(1,1) PRIMARY KEY,
  id_alarma      INT NOT NULL,
  hora_local     TIME(0) NULL,          
  dias_semana    INT NULL,              
  fecha_inicio   DATE NULL,
  fecha_fin      DATE NULL,
  rrule          NVARCHAR(512) NULL,    
  CONSTRAINT FK_horario_alarma FOREIGN KEY(id_alarma) REFERENCES dbo.alarmas(id_alarma),
  CONSTRAINT CK_horario_rrule CHECK ( (rrule IS NOT NULL) OR (hora_local IS NOT NULL) )
);
GO


CREATE TABLE dbo.retos_catalogo(
  id_reto       INT IDENTITY(1,1) PRIMARY KEY,
  tipo          NVARCHAR(40)  NOT NULL,     
  dificultad    NVARCHAR(16)  NOT NULL,     
  parametros    NVARCHAR(MAX) NULL,
  activo        BIT           NOT NULL CONSTRAINT DF_reto_activo DEFAULT(1),
  CONSTRAINT CK_reto_params_json CHECK (parametros IS NULL OR ISJSON(parametros)=1)
);
GO


CREATE TABLE dbo.retos_alarma(
  id_reto_alarma  INT IDENTITY(1,1) PRIMARY KEY,
  id_alarma       INT NOT NULL,
  id_reto         INT NOT NULL,
  obligatorio     BIT NOT NULL CONSTRAINT DF_reto_oblig DEFAULT(1),
  orden           SMALLINT NOT NULL CONSTRAINT DF_reto_orden DEFAULT(1),
  CONSTRAINT FK_ra_alarma FOREIGN KEY(id_alarma) REFERENCES dbo.alarmas(id_alarma),
  CONSTRAINT FK_ra_reto   FOREIGN KEY(id_reto)   REFERENCES dbo.retos_catalogo(id_reto)
);
GO

CREATE TABLE dbo.sesiones_reto(
  id_sesion      INT IDENTITY(1,1) PRIMARY KEY,
  id_alarma      INT NOT NULL,
  fecha_disparo  DATETIME2(3) NOT NULL,
  fecha_completado DATETIME2(3) NULL,
  resultado      NVARCHAR(20) NOT NULL,  
  snoozes_usados TINYINT NOT NULL CONSTRAINT DF_ses_snoozes DEFAULT(0),
  intentos       SMALLINT NOT NULL CONSTRAINT DF_ses_intentos DEFAULT(0),
  CONSTRAINT FK_ses_alarma FOREIGN KEY(id_alarma) REFERENCES dbo.alarmas(id_alarma)
);
GO


CREATE TABLE dbo.pasos_sesion_reto(
  id_paso     INT IDENTITY(1,1) PRIMARY KEY,
  id_sesion   INT NOT NULL,
  id_reto     INT NOT NULL,
  inicio      DATETIME2(3) NOT NULL,
  fin         DATETIME2(3) NULL,
  resultado   NVARCHAR(10) NOT NULL, -- exito/fallo
  datos       NVARCHAR(MAX) NULL,
  CONSTRAINT FK_psr_sesion FOREIGN KEY(id_sesion) REFERENCES dbo.sesiones_reto(id_sesion),
  CONSTRAINT FK_psr_reto   FOREIGN KEY(id_reto)   REFERENCES dbo.retos_catalogo(id_reto),
  CONSTRAINT CK_psr_datos_json CHECK (datos IS NULL OR ISJSON(datos)=1)
);
GO




CREATE TABLE dbo.puntos(
  id_puntos   INT IDENTITY(1,1) PRIMARY KEY,
  id_usuario  INT NOT NULL,
  motivo      NVARCHAR(40) NOT NULL,  
  puntos      INT NOT NULL,
  fecha       DATETIME2(3) NOT NULL CONSTRAINT DF_puntos_fecha DEFAULT SYSUTCDATETIME(),
  id_sesion   INT NULL,
  CONSTRAINT FK_puntos_usuario FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT FK_puntos_sesion  FOREIGN KEY(id_sesion)  REFERENCES dbo.sesiones_reto(id_sesion)
);
GO


CREATE TABLE dbo.clasificaciones(
  id_clasificacion INT IDENTITY(1,1) PRIMARY KEY,
  nombre           NVARCHAR(80) NOT NULL, 
  periodo          NVARCHAR(16) NOT NULL, 
  fecha_inicio     DATE NOT NULL,
  fecha_fin        DATE NOT NULL
);
GO


CREATE TABLE dbo.entradas_clasificacion(
  id_clasificacion INT NOT NULL,
  id_usuario       INT NOT NULL,
  puntos           INT NOT NULL CONSTRAINT DF_entcla_pts DEFAULT(0),
  CONSTRAINT PK_entradas_clasificacion PRIMARY KEY(id_clasificacion, id_usuario),
  CONSTRAINT FK_entcla_clas FOREIGN KEY(id_clasificacion) REFERENCES dbo.clasificaciones(id_clasificacion),
  CONSTRAINT FK_entcla_user FOREIGN KEY(id_usuario)       REFERENCES dbo.usuarios(id_usuario)
);
GO


CREATE TABLE dbo.logros(
  id_logro   INT IDENTITY(1,1) PRIMARY KEY,
  codigo     NVARCHAR(60) NOT NULL UNIQUE,
  titulo     NVARCHAR(120) NOT NULL,
  descripcion NVARCHAR(500) NULL,
  icono_uri  NVARCHAR(500) NULL
);
GO


CREATE TABLE dbo.logros_usuario(
  id_usuario INT NOT NULL,
  id_logro   INT NOT NULL,
  fecha_obtenido DATETIME2(3) NOT NULL CONSTRAINT DF_logusr_fecha DEFAULT SYSUTCDATETIME(),
  CONSTRAINT PK_logros_usuario PRIMARY KEY(id_usuario, id_logro),
  CONSTRAINT FK_logusr_user FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT FK_logusr_logro FOREIGN KEY(id_logro)   REFERENCES dbo.logros(id_logro)
);
GO




CREATE TABLE dbo.notificaciones(
  id_notificacion INT IDENTITY(1,1) PRIMARY KEY,
  id_usuario      INT NOT NULL,
  tipo            NVARCHAR(24) NOT NULL, 
  titulo          NVARCHAR(120) NULL,
  mensaje         NVARCHAR(500) NULL,
  deep_link       NVARCHAR(300) NULL,
  programada_para DATETIME2(3) NULL,
  enviada_en      DATETIME2(3) NULL,
  estado          NVARCHAR(16) NOT NULL CONSTRAINT DF_notif_estado DEFAULT N'pendiente',
  id_dispositivo  INT NULL,
  CONSTRAINT FK_notif_usuario    FOREIGN KEY(id_usuario)     REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT FK_notif_dispositivo FOREIGN KEY(id_dispositivo) REFERENCES dbo.dispositivos(id_dispositivo)
);
GO


CREATE TABLE dbo.registro_eventos(
  id_evento     BIGINT IDENTITY(1,1) PRIMARY KEY,
  id_usuario    INT NULL,
  id_dispositivo INT NULL,
  tipo_evento   NVARCHAR(40) NOT NULL, 
  fecha_evento  DATETIME2(3) NOT NULL CONSTRAINT DF_evento_fecha DEFAULT SYSUTCDATETIME(),
  detalles      NVARCHAR(MAX) NULL,
  CONSTRAINT CK_evento_detalles_json CHECK (detalles IS NULL OR ISJSON(detalles)=1),
  CONSTRAINT FK_evento_usuario    FOREIGN KEY(id_usuario)    REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT FK_evento_dispositivo FOREIGN KEY(id_dispositivo) REFERENCES dbo.dispositivos(id_dispositivo)
);
GO



CREATE TABLE dbo.planes(
  id_plan         INT IDENTITY(1,1) PRIMARY KEY,
  codigo          NVARCHAR(40) NOT NULL UNIQUE,
  nombre          NVARCHAR(100) NOT NULL,
  caracteristicas NVARCHAR(MAX) NULL,
  precio_centavos INT NOT NULL CHECK (precio_centavos >= 0),
  periodo         NVARCHAR(16) NOT NULL 
);
GO

CREATE TABLE dbo.suscripciones(
  id_suscripcion INT IDENTITY(1,1) PRIMARY KEY,
  id_usuario     INT NOT NULL,
  id_plan        INT NOT NULL,
  estado         NVARCHAR(20) NOT NULL, 
  inicio         DATETIME2(3) NOT NULL CONSTRAINT DF_sus_inicio DEFAULT SYSUTCDATETIME(),
  fin            DATETIME2(3) NULL,
  cancelada_en   DATETIME2(3) NULL,
  CONSTRAINT FK_susc_user FOREIGN KEY(id_usuario) REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT FK_susc_plan FOREIGN KEY(id_plan)    REFERENCES dbo.planes(id_plan)
);
GO



CREATE TABLE dbo.consentimientos(
  id_consentimiento INT IDENTITY(1,1) PRIMARY KEY,
  codigo            NVARCHAR(40) NOT NULL,
  version           NVARCHAR(20) NOT NULL,
  url_texto         NVARCHAR(500) NULL,
  fecha_creacion    DATETIME2(3) NOT NULL CONSTRAINT DF_cons_fecha DEFAULT SYSUTCDATETIME(),
  CONSTRAINT UX_consentimiento UNIQUE(codigo, version)
);
GO

CREATE TABLE dbo.consentimientos_usuario(
  id_usuario         INT NOT NULL,
  id_consentimiento  INT NOT NULL,
  aceptado_en        DATETIME2(3) NOT NULL CONSTRAINT DF_consu_aceptado DEFAULT SYSUTCDATETIME(),
  revocado_en        DATETIME2(3) NULL,
  CONSTRAINT PK_consu PRIMARY KEY(id_usuario, id_consentimiento),
  CONSTRAINT FK_consu_user  FOREIGN KEY(id_usuario)        REFERENCES dbo.usuarios(id_usuario),
  CONSTRAINT FK_consu_cons  FOREIGN KEY(id_consentimiento) REFERENCES dbo.consentimientos(id_consentimiento)
);
GO