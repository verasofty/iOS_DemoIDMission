//
//  Constantes.swift
//  DemoIDMission
//
//  Created by Juda Escalera on 05/11/24.
//

import Foundation

struct Constantes {
    
    //Images
    static let CARD_ONSIGNA :String = "tarjeta"
    static let CARD_ONSIGNA_DISABLED : String = "kash_disabled"
    static let BACK_IMAGE: String = "bg_principal.png"
    static let BACK_IMAGE_BACKGROUND_3: String = "background_3"
    static let BACK_IMAGE_NULL: String = "nill.png"
    static let BACK_IMAGE_MENU: String = "FondoMenuLateral"
    static let BACK_GRADIENT: String = "back_gradient.png"
    static let LOGO: String = "logo_kash.png"
    static let MENU_HAMBURGUESA: String = "line.horizontal.3"
    static let TURN_OFF:String = "power"
    static let IMG_MEX = "country_mex"
    static let IMG_VEN = "country_ven"
    static let IMG_USA = "country_usa"
    static let IC_PAY_NAV = "ic_pay_nav"
    static let IC_LECTOR = "ic_lector_white"
    static let COLOR_DORADO_KASH = "C7924C"
    static let COLOR_NEGRO = "000000"
    static let COLOR_KASH_DARK = "323f4f"
    static let COLOR_KASH_DARK2 = "333F50"
    static let CODIGO_RETIRO_CAJERO = 12
    static let CODIGO_COMPRA_FISICA = 13
    //static let CODIGO_COMPRA_FISICA = 13
    
    //String
    /*
     _permission_denied = "Permiso denegado"
     _message_permission_camera = "Necesita dar el permiso para el uso de la camera"
     _go_to_settings = "Ir a Configuración"
     
     */
    static let PERMISSION_DENIED = "_permission_denied"
    static let MESSAGE_PERMISSION_CAMERA = "_message_permission_camera"
    static let GO_TO_SETTINGS = "_go_to_settings"
    static let INE_FRONTAL = "_ine_frontal"
    static let INE_POSTERIOR = "_ine_posterior"
    static let SELFIE = "_selfie"
    static let PASAPORTE_TITLE = "_pasaporte"
    static let VERIFIQUE_CP_INGRESADO = "_verifique_cp"
    static let TRANSFERENCIA_MISMO_BANCO = "_transfer_mismo_banco"
    static let TRANSFERENCIA_INTERBANCARIA = "_transfer_interbancaria"
    static let TITLE_PROTEGERME = "_title_protegerme"
    static let TITLE_APRENDER = "_title_aprender"
    static let TITLE_AHORRAR = "_title_ahorrar"
    static let TITLE_PRESTAMO = "_title_prestamo"
    static let TITLE_OPERACIONES = "_title_operaciones"
    static let TITLE_SERVICIOS = "_title_servicios"
    static let TITLE_RECARGAS = "_title_recargas"
    static let TITLE_DEPOSITO = "_title_deposito"
    static let TITLE_TRANSFER = "_title_transfer"
    static let TITLE_TRANSFER_USA = "_title_transfer_usa"
    static let TITLE_RETIRO = "_title_retiro"
    
    static let CANCELAR_RETIRO = "_cancelar_retiro"
    static let ELIMINAR_RETIRO = "_eliminar_retiro"
    static let ERROR_PLD = "_error_pld"
    static let USER_APP_KASH = "ONSIGNA_KASH"
    static let USER_APP_BIVO = "BIVO"
    static let TECHREO_FRENTE = "card_techreo"
    static let TECHREO_REVERSA = "card_techreo_reverso"
    static let KASH_FRENTE = "kash_frente"
    static let KASH_REVERSO = "kash_reverso"
    static let BIVO_FRENTE = "kash_frente"
    static let BIVO_REVERSO = "kash_reverso"
    static let EMPTY_STRING = ""
    static let TARJETA_VIRTUAL = "virtual"
    static let TARJETA_FISICA = "fisica"
    static let CODIGO_CUENTA_SIN_TARJETA = "00"
    static let CODIGO_TARJETA_BLOQUEADA = "28"
    static let CODIGO_TARJETA_REPORTE_ROBO = "21"
    static let CODIGO_TARJETA_REPORTE_ROBO_2 = "23"
    static let CODIGO_TARJETA_ACTIVA = "01"
    static let COUNTRY_MEX = "México"
    static let COUNTRY_USA = "USA"
    static let COUNTRY_VEN = "Venezuela"
    static let GREEN_COLOR = "#00A579"
    static let BLUE_DARK_COLOR = "#003C7A"
    static let GUNMETAL_COLOR = "#2A2F3D"
    static let OPERATION_CVV = "OPERATION_CVV"
    static let OPERATION_PIN = "OPERATION_PIN"
    static let OPERATION_RECHARGE = "OPERATION_RECHARGE"
    static let OPERATION_SERVICES = "OPERATION_SERVICES"
    static let OPERATION_TRANSF = "OPERATION_TRANSF"
    static let OPERATION_RETIRO = "OPERATION_RETIRO"
    static let SLIDE_LEFT = "slideLeft"
    static let SLIDE_RIGHT = "slideRight"
    static let TARJETA_FONDOS_PROPIOS = "K754"
    static let FEMENINO = "_femenino"
    static let MASCULINO = "_masculino"
    
    //MyDataVC
   // static let Street = "_Street"
    static let COLOGNE = "_Cologne"
    static let BACKBUTTON = "_backButton"
    
    /*
     Principal -> Q154
     Ahorra -> k754
     */
    
    //KEYS for PREFERENCES
    static let NUMEROS_TELEFONO_NO_COINCIDEN = "_numero_telefono_no_coincide"
    static let CERRAR_SESION_REEMPLAZO = "_cerrar_sesion_reemplazo"
    static let SELECCIONA_ESTADO_CIVIL = "_selecciona_estado_cil"
    static let MARITAL_STATUS_CATALOGUE = "_json_civil_status"
    static let MARITAL_STATUS_DICTIONARY = "maritalStatusCatalogue"
    static let REMEMBER_EMAIL_DEFAULT = "remember_email_default"
    static let USER_EMAIL_DEFAULT: String = "user_default"
    static let USER_REMEMBER_DATA_DEFAULT = "user_remember_data_default"
    static let VIRTUAL_ACCOUNT_DEFAULT = "virtual_account_default"
    static let SUCURSAL_DEFAULT = "sucursal_default"
    static let USER_ID_DEFAULT = "user_id_default"
    static let CLABE_DEFAULT = "clabe_default"
    static let PHONE_DEFAULT = "phone_default"
    static let MAIL_IDMISSION = "mail_idmission"
    static let FULL_NAME_DEFAULT = "full_name_default"
    static let REGISTRATION_DATE_DEFAULT = "registration_date_default"
    static let STATE_REGISTRATION_DEFAUL = "state_registration_default"
    static let IS_ACTIVE_NOTIFICATION = "IS_ACTIVE_NOTIFICATION"
    static let ALIAS_DEFAULT = "alias_default"
    static let CODE_OPERATIONS_DEFAULT = "CODE_OPERATIONS_DEFAULT"
    static let PASSWORD_DEFAULT = "PASSWORD_DEFAULT"
    static let TRANSACTION_SECUENCE_DEFAULT = "TRANSACTION_SECUENCE_DEFAULT"
    static let HIDE_TUTORIAL: String = "HIDE_TUTORIAL"
    static let FACEID_DEFAULT = "face_id_default"
    static let TIME_OUT = "TIME_OUT"
    static let INGRESE_TELEFONO_VALIDO = "_ingrese_numero_telefonico"
    static let ERROR_DATO_INICIO = "_error_dato_inicio"
    static let RASTREO = "_rastreo"
    static let REFERENCIA = "_referencia"
    static let BLANK_SPACE = " "
    static let ELIMINAR_CONTACTO = "_eliminar"
    static let DESCRIPTION_DELETE = "_descripcion_eliminar"
    static let TIPO_CAMBIO = "_tipo_cambio"
    static let FECHA_VALOR = "_fecha_valor"
    static let DESCRIPCION_COMISION_UNO = "_descripcion_comission_uno"
    static let DESCRIPCION_COMISION_DOS = "_descripcion_comission_dos"
    static let CONCEPTO = "_concepto"
    static let MENSAJE_PREVIO_DOCUMENTO = "_mensaje_previo_documento"
    static let LIGHT = "light"
    static let FOCUS = "focus"
    static let ALIGN_DOCUMENT_IMG_CAPTURE = "align_document_img_capture"
    static let SUBJECT_IS_TOO_DARK = "subject_is_too_dark_img_capture"
    static let OUT_OF_FOCUS = "out_of_focus_img_capture"
    static let TOO_MUCH_GLARE = "too_much_glare_img_capture"
    static let PAGE_TITLE_IMAGE_CAPTURE = "page_title_image_capture"
    static let CAPTURING_ID_SAMBARCODE = "capturing_id_scanbarcode"
    static let CAPTURING_ID_SCANBARCODE_MSG = "capturing_id_scanbarcode_msg"
    static let GLARE = "glare"
    static let ALIGN_ID_AND_MRZ_INSIDE_RCTANGLE = "align_id_and_mrz_inside_rectangle"
    static let ALIGN_BARCODE_INSIDE_RECTANGLE = "align_barcode_inside_rectangle"
    static let MRZ_NOT_DETECTED = "mrz_not_detected"
    static let MRZ_DETECTED_NOT_VALID = "mrz_detected_not_valid"
    static let BARCODE_MRZ_NOT_FOUND = "barcode_mrz_not_found"
    static let BARCODE_DETECTED_ERROR_MESSAGE = "barcode_detected_error_message"
    static let CAPTURING_ID_SCANBARCODE_PDF = "capturing_id_scanbarcode_pdf_417_msg"
    static let CAPTURING_ID_BARCODE_PDF417 = "capturing_id_scanbarcode_pdf417_msg"
    static let MOVE_ID_CLOSER = "move_id_closer"
    static let MOVE_ID_WAY = "move_id_away"
    static let ALIGN_DOCUMENT_INSIDE_RECTANGLE = "align_document_inside_rectangle"
    static let ID_CAPTURE_PREVIEW_HEADER = "id_capture_preview_header"
    static let ID_CAPTURE_PREVIEW_MESSAGE = "id_capture_preview_message"
    static let BARCODE_ERROR_MESSAGE = "barcode_error_message"
    static let MRZ_ERROR_MESSAGE = "mrz_error_message"
    static let BARCODE_MRZ_ERROR_MESSAGE = "barcode_mrz_error_message"
    static let ID_CAPTURE_SUCCESS_MESSAGE = "id_capture_success_message"
    static let ID_CAPTURE_INSTRUCTION_CONTINUE = "id_capture_instruction_continue"
    static let LANGUAJE_IDMISSION = "_languaje_idmission"
    /*
     _referencia = "Reference: ";
     _rastreo = "Tracking number: ";
     
     */
    //KEYS for Strings
    static let PERMISO_BIOMETRIC_AUTHENTICATION = "_permiso_de_face_id"
    static let TOUCH_ID_MENSAJE = "_touch_id_mensaje"
    static let FACE_ID_MENSAJE = "_face_id_mensaje"
    static let ACTUALIZAR = "_actualizar"
    static let NUEVA_VERSION = "_nueva_version";
    static let MENSAJE_ACTUALIZAR = "_mensaje_actualizar"
    static let REGRESAR = "_regresar"
    static let TARJETA_INACTIVA = "_tarjeta_inactiva"
    static let TRANSACTION_APPROVED = "_approved"
    static let APP_NAME = "_app_name"
    static let PASSWORD = "password"
    static let INGRESE_CORREO_VALIDO = "_ingrese_correo_valido"
    static let INGRESE_PASS_VALIDO = "_ingrese_password_valido"
    static let RECUPERAR_CONTRASEÑA = "_recuperar_contrasena"
    static let INGRESE_MAIL = "_ingrese_email"
    static let VERIFICANDO_CREDENCIALES = "_verificando_credenciales"
    static let REALIZANDO_REGISTRO = "_realizando_registro"
    static let VERFIQUE_CODIGO = "_verifique_codigo_recibido"
    static let VALIDATE = "_validar"
    static let INGRESE_CODIGO = "_enter_code"
    static let INGRESE_PIN = "_enter_pin"
    static let ESPERE = "_espere"
    static let VER_CVV = "_ver_cvv"
    static let AGREGAR_TARJETA = "_agregar_tarjeta"
    static let TARJETA = "_tarjeta"
    static let MOVIMIENTOS = "_movimientos"
    static let AGREGAR = "_agregar"
    static let AYUDA = "_ayuda"
    static let COFIGURACIÓN = "_configuracion"
    static let TERMINOS_Y_CONDICIONES = "_terminosYCondiciones"
    static let CERRAR = "_cerrar"
    static let CORREO_ENVIADO = "_correo_enviado"
    static let TERM_COND = "_term_cond"
    static let OPERACION_EXITOSA = "_operacion_exitosa"
    static let CODIGO = "_codigo"
    static let MONTO_INVALIDO = "_ingrese_monto_valido"
    static let SIN_MULTITARJETAS = "_no_tarjeta"
    static let INGRESE_CONTRASEÑA_ACTUAL = "_ingrese_contrasena_actual"
    static let CONTRASEÑA_INVALIDA = "_contrasena_invalida"
    static let INGRESE_NUEVA_CONSTRASEÑA = "_ingrese_nueva_contrasena"
    static let CONFIRME_CONTRASEÑA = "_confirme_contrasena"
    static let CONTRASEÑA_NO_COINCIDE = "_contrasena_no_coincide"
    static let CONTRASEÑA_ACTUALIZADA = "_contrasena_actualiza"
    static let TARJETA_BLOQUEADA = "_tarjeta_bloqueada"
    static let TARJETA_BLOQUEADA_DOS = "_tarjeta_bloqueada_dos"
    static let TARJETA_BLOQUEADA_CORTO = "_tarjeta_bloqueada_corto";
    static let PAGOS = "_pagos"
    static let PAGAR = "_pagar"
    static let CIERRE_SESION = "_cerrar_sesion"
    static let TITULO_CONFIGURACION = "_titulo_configuracion"
    static let CAMBIO_CONTRASENA = "_cambio_contrasena"
    static let PAGO_SERVICIOS = "_pago_servicios"
    static let ACTIVAR = "_activar";
    static let SEGURIDAD_BIOMETRICA = "_seguridad_biometrica";
    static let MENSAJE_BIOMETRICA = "_mensaje_biometrica";
    static let MESSAGE_CVV = "_message_cvv"
    /**
     _ingresar_nueva_tarjeta = "Ya tengo mi nueva tarjeta";
     _tarjeta_bloqueada_robo = "Tarjeta bloqueada por robo o extravío";
     */
    static let IR_PERMISOS = "_ir_permisos"
    static let YA_TENGO_NUEVA_TARJETA = "_ingresar_nueva_tarjeta"
    static let MENSAJE_TARJETA_BLOQUEADA_ROBO = "_tarjeta_bloqueada_robo"
    static let MINUTOS = "_minutos"
    static let SEGUNDOS = "_segundos"
    static let CONFIRME_CIERRE_SESION = "_confirme_cierre_sesion"
    static let FONDOS_INSUFICIENTES = "_fondos_insuficientes"
    static let NUMERO_TELEFONO = "_numero_telefono"
    static let NUMERO_TARJETA:String = "_numero_tarjeta"
    static let INVALIDO_NUMERO_TARJETA:String = "_invalido_numero_tarjeta"
    static let CURP_INVALIDO = "_ingrese_curp_valido"
    static let INGRESE_NOMBRE = "_ingrese_nombre"
    static let INGRESE_APELLIDO = "_ingrese_apellido"
    static let INGRESE_APELLIDO_MATERNO = "_ingrese_apellido_materno"
    static let INGRESE_CURP = "_ingrese_curp"
    static let INGRESE_VIGENCIA_DOC = "_ingrese_vigencia_documento"
    static let INGRESE_DOC_NUMBER = "_ingrese_numero_documento"
    static let INVALIDO_ANIO_VIGENCIA = "_ingrese_vigencia_documento"
    static let DOC_NUMBER_INVALID = "_numero_doc_invalido"
    static let COD_POSTAL = "_codigo_postal"
    static let CALLE = "_calle"
    static let DEPARTAMENTO = "_departamento"
    static let PISO = "_piso"
    static let NUMERO = "_numero"
    static let INGRESE_CALLE = "_ingrese_calle"
    static let INGRESE_NUMERO = "_ingrese_numero"
    static let INGRESE_COD_POSTAL = "_ingrese_cod_postal"
    static let TELEFONO = "_telefono"
    static let RFC = "_rfc"
    static let CODE_COUNTRY = "_code_country"
    static let RAZON_SOCIAL = "_razon_social"
    static let INGRESE_TELEFONO = "_ingrese_telefono"
    static let ERROR_REFERIDO = "_error_referido"
    static let INGRESE_RAZON_SOCIAL = "_ingrese_razon_social"
    static let INGRESE_RFC = "_ingrese_rfc"
    static let ACTIVA = "_activa"
    static let INACTIVA = "_inactiva"
    static let CUENTA_ENCONTRADA = "_cuenta_encontrada"
    static let SELECCIONA_BANCO = "_selecciona_banco_cuenta"
    static let CUENTA_INVALIDA = "_cuenta_invalida";
    static let INGRESE_NOMBRE_BENEFICIARIO = "_ingrese_nombre_beneficiario";
    static let APROBADA = "_aprobada"
    static let FECHA_INVALDA = "_ingrese_fecha_valida"
    static let NO_MAYOR_EDAD = "_necesario_mayor_edad"
    static let EXPIRA_EN = "_expira_en"
    static let IMPORTANTE = "_importante"
    static let MENSAJE_ESCANEAR = "_mensaje_escaner"
    static let CAPTURAR = "_capturar"
    static let ESCANEAR = "_escanear"
    static let CONFIRMA_PAGO = "_confirma_pago"
    static let COMISION_DE = "_comision_de"
    static let CON_REFERENCIA = "_con_referencia"
    static let DE_COMPAÑIA = "_de_la_compania"
    static let CON_CARGO = "_con_cargo"
    static let SALDO_AL = "_saldo_al"
    static let ULTIMO_ACCESO = "_ultimo_acceso"
    static let SERVICIO = "_servicio"
    static let NUMEROS_NO_COINCIDEN = "_numeros_no_coinciden"
    static let CERRAR_POR_INACTIVIDAD = "_cerrar_inactividad"
    static let CORREO_NO_COINCIDE = "_correo_no_coinciden"
    static let PASS_INVALIDO = "_pass_invalido"
    static let INGRESE_COLONIA = "_ingrese_colonia"
    static let INGRESE_PAIS = "_selecciona_pais"
    static let REENVIO_CODIGO = "_reenviar_codigo"
    static let CODIGO_ENVIADO = "_codigo_enviado"
    static let DENUNCIAR_EXTRAVIO = "_reportar_tarjeta"
    static let GUARDAR_CONFIGURACION = "_guardar_configuracion"
    static let TARJETA_EXTRAVIADA = "_tarjeta_extraviada"
    static let TITULO_BLOQUEO = "_titulo_bloqueo"
    static let MENSAJE_BLOQUEO = "_mensaje_confirmacion_bloqueo"
    static let DENUNCIA_REALIZADA = "_denuncia_realizada"
    static let MSJ_TARJETA_REMPLAZADA = "_mensaje_tarjeta_reemplazada"
    static let TITULO_TARJETA_REMPLAZADA = "_titulo_tarjeta_reemplazada"
    static let VER_TARJETA = "_ver_tarjeta"
    static let FONDOS_PROPIOS_VALIDACION = "_fondos_propios_validacion"
    static let TARJETA_INNOMINADA = "_tarjeta_innominada"
    static let TERMINOS_CONDICIONES = "_terminos_condiciones"
    static let AVISO_PRIVACIDAD = "_aviso_privacidad"
    static let PRODUCTO_DIGITAL = "_producto_digital"
    static let CONTRATO_DIGITAL = "_contrato_digital"
    static let NECESITAS_ACEPTAR = "_necesitas_aceptar"
    static let VERIFICAR_IMAGENES = "_verificar_imagenes"
    static let VERIFICAR_DATOS_ENTRADA = "_verifique_datos_entrada"
    static let VERSION_APP = "_version"
    static let CONFIRMATION = "_confirmacion"
    static let CONFIRM = "_confirmar"
    static let CLAVE_RASTREO = "_clave_rastreo"
    static let TITULO_GPS = "_mensaje1"
    static let MENSAJE_GPS = "_mensaje2"
    static let FOOTER_GPS = "_mensaje3"
    static let IR_CONFIGURACION = "_ir_configuracion"
    static let MENSAJE_REFERIDO = "_mensaje_uno_referido"
    static let MI_CUENTA_EFECTIVO = "_mi_cuenta_deposito_efectivo"
    static let MI_CUENTA_TECHREO = "_mi_cuenta_deposito_techreo"
    static let MI_CUENTA_BANCOS = "_mi_cuenta_deposito_bancos"
    static let INGRESE_CVV = "_ingrese_cvv"
    static let ERROR_DATOS_DOCUMENTO = "_datos_error_extraccion"
    static let MENSAJE_UNO_FARMACIA_AHORRO = "_instrucciones_farmacia_ahorro_uno"
    static let MENSAJE_DOS_FARMACIA_AHORRO = "_instrucciones_farmacia_ahorro_dos"
    static let VERIFIQUE_DATO_ENTRADA = "_verifique_dato_entrada"
    /*
     
     */
    
    static let PASAPORTE = "PP"
    static let CREDENCIAL_INE = "VID"
    static let DNI_ARGENTINO = "NID"
    
    static let ISO_MEX = "MEX"
    static let ISO_USA = "USA"
    /*
     PASSPORT("PP"),
     NATIONAL_ID("NID"),
     RESIDENCE_CARD("RID"),
     DRIVERS_LICENSE("DL"),
     PHOTO_ID_CARD("PID"),
     VOTER_ID_CARD("VID"),
     */
    
    static let CANCELAR = "_cancelar"
    static let ACEPTAR = "_aceptar"
    static let ESTADOS_UNIDOS = "_usa"
    static let ESTADO = "_estado"
    static let MUNICIPIO = "_municipio"
    
    //MARK: - Constantes para IDMission
    
    static let IDM_FIRST_NAME_DOC = "FirstName_Doc"
    static let IDM_LAST_NAME = "Last_Name"
    static let IDM_LAST_NAME_TWO = "Last_Name2"
    static let IDM_CURP = "IDNumber1"
    static let IDM_EMPIRATION_DATE = "Expiration_Date"
    static let IDM_INE_NUMBER = "IDNumber2"
    static let IDM_MRZ_IDNUMER = "MRZ_IDNumber"
    static let IDM_MRZ_NATIONALITY = "MRZ_Nationality"
    static let IDM_NATIONALITY = "Nationality"
    static let IDM_IDNUMER_1 = "ID_Number"
    static let IDM_GENDER = "Gender"
    static let IDM_DATEBIRTH = "Date_of_Birth"
    static let REQUEST_ID = "Request_Id"
    static let FORM_KEY = "FormKey"
    static let FORM_ID = "FormId"
    
    //Constantes para Analytics
    static let ANALYTICS_USER = "ANALYTICS_USER"
    static let ANALYTICS_LOGIN = "ANALYTICS_LOGIN"
    static let ANALYTICS_REGISTER = "ANALYTICS_REGISTER"
    static let ANALYTICS_DATE = "ANALYTICS_DATE"
    
    //Storyboard ID
    static let PERMISSION_TECHREO = "permissionCardTechreoVC"
    static let HOME_TECHREO = "homeTechreoVC"
    static let CONTACT_VC:String = "contactVC"
    static let ABOUT_VC = "aboutView"
    static let MODAL_VC:String = "modalVC"
    static let PDF_VC:String = "pdfVC"
    static let TERMS_KASH = "termsConditionsKASH"
    static let TO_VALIDATE_EMAIL:String = "toValidateMail"
    static let TO_TERMINOS:String = "toTerminos"
    static let TO_MAIN:String = "VCMain"
    static let TO_MOVIMIENTO = "toMovementsVC"
    static let TO_REFERED = "toReferVC"
    static let TO_DETAIL:String = "toDetail"
    static let TO_TRANSFER:String = "toTransfer"
    static let MENU_VC:String = "menuVC"
    static let SUCESSFUL_VC:String = "sucessfulVC"
    static let SETTINGS_VC:String = "initSetting"
    static let MOVEMENTS_VC:String = "movementsVC"
    static let SHOW_ACCOUNT_VC = "showAccountVC"
    static let TO_STATUS_CARD:String = "toStatusCard"
    static let TO_DATA_USER = "toDataUser"
    static let TO_DOMICILE = "toDomicile"
    static let TO_FISCAL_VC = "toFiscalVC"
    static let INACTIVITY_VC = "inactivityVC"
    static let TO_SUCESSFUL_VC = "toSucessfulVC"
    static let CHECK_PIN = "checkPIN"
    static let TO_DESTINY_ACCOUNT = "toDestinyAccount"
    static let TO_SAVE_ACCOUNT = "toSaveAccount"
    static let TO_MAKE_TRANSFER = "toMakeTransferVC"
    static let TO_DATA_TRANSFER = "toDataTransferVC"
    static let TO_SUCESSFUL_TRANSFER = "toSucessfulTransferVC"
    static let TO_CONTACTO_TABLE = "contactoTableVC"
    static let TO_ENTER_PASS_VC = "enterPassVC"
    static let TO_PRODUCT_VC = "toSelectedService"
    static let TO_PAY_PRODUCT_VC = "toPayProductVC"
    static let COMISSION_VC = "comissionVC"
    static let TO_SELECT_PACKAGE_VC = "toSelectPackageVC"
    static let TO_CONFIRM_RECHARGE_VC = "toConfirmVC"
    static let TO_CARD_REPLACEMENT = "cardReplacementVC"
    static let TO_CONFIRM_BLOCK = "toBlockMessageCard"
    static let TO_REGISTER_USER = "toRegisterUser"
    static let TO_HELP_VC = "toHelpVC"
    static let HAVE_CARD_VC = "haveMyCard"
    static let TO_TYPE_DOCUMENT_VC = "toSelectTypeDocument"
    static let TO_ID_MISSION_VC = "toIdMissionVC"
    static let NOT = "_not"
    static let YES = "_yes"
    static let MOV = "_mov"
    static let INFOR = "_infor"
    static let PERMI = "_permi"
    /*
     _mov = "Movements";
     _infor = "Information";
     _permi = "Permissions";
     */
    
    
    
    static let CLAVE_INTERBANCARIA_COPIADA = "_copied_interbank_code"
    static let NUMERO_TELEFONICO_COPIADO = "_copied_phone_number"
    static let NUMERO_DE_CUENTA_COPIADO = "_copied_account_number"
    static let SOLICITUD_DE_TARJETA_APROBADA = "_Card_application_approved"
    static let ENTREGA_DE_TARJETA = "_Delivery_of_your_card"
    static let REEMPLAZO_EXITOSOS = "_Successful_replacement"
    static let REEMPLAZAR = "_Replace"
    static let Pending_payment = "_Pending_payment"
    static let  Charged = "_Charged"
    static let The_QR_code_is_not_recognized = "_The_QR_code_is_not_recognized"
    static let The = "_The"
    static let Select_the_bank = "_Select_the_bank"
    static let SALDO_DISPONIBLE = "_saldo_disponible"
    
    static let PAISES = [
        "México",
        "Estados Unidos",
        "Afganistán",
        "Albania",
        "Alemania",
        "Andorra",
        "Angola",
        "Antigua y Barbuda",
        "Arabia Saudita",
        "Argelia",
        "Argentina",
        "Armenia",
        "Australia",
        "Austria",
        "Azerbaiyán",
        "Bahamas",
        "Bangladesh",
        "Barbados",
        "Bahréin (Baréin)",
        "Bélgica",
        "Belice",
        "Benín",
        "Bielorrusia",
        "Birmania/Myanmar",
        "Bolivia",
        "Bosnia y Herzegovina",
        "Botsuana",
        "Brasil",
        "Brunéi",
        "Bulgaria",
        "Burkina Faso",
        "Burundi",
        "Bután",
        "Cabo Verde",
        "Camboya",
        "Camerún",
        "Canadá",
        "Catar",
        "Chad",
        "Chile",
        "China",
        "Chipre",
        "Ciudad del Vaticano",
        "Colombia",
        "Comoras",
        "Corea del Norte",
        "Corea del Sur",
        "Costa de Marfil",
        "Costa Rica",
        "Croacia",
        "Cuba",
        "Dinamarca",
        "Dominica",
        "Ecuador",
        "Egipto",
        "El Salvador",
        "Emiratos Árabes Unidos",
        "Eritrea",
        "Eslovaquia",
        "Eslovenia",
        "España",
        "Estonia",
        "Etiopía",
        "Filipinas",
        "Finlandia",
        "Fiyi",
        "Francia",
        "Gabón",
        "Gambia",
        "Georgia",
        "Ghana",
        "Granada",
        "Grecia",
        "Guatemala",
        "Guyana",
        "Guinea",
        "Guinea ecuatorial",
        "Guinea-Bisáu",
        "Haití",
        "Honduras",
        "Hungría",
        "India",
        "Indonesia",
        "Irak",
        "Irán",
        "Irlanda",
        "Islandia",
        "Islas Marshall",
        "Islas Salomón",
        "Israel",
        "Italia",
        "Jamaica",
        "Japón",
        "Jordania",
        "Kazajistán",
        "Kenia",
        "Kirguistán",
        "Kiribati",
        "Kuwait",
        "Laos",
        "Lesoto",
        "Letonia",
        "Líbano",
        "Liberia",
        "Libia",
        "Liechtenstein",
        "Lituania",
        "Luxemburgo",
        "Macedonia del Norte",
        "Madagascar",
        "Malasia",
        "Malaui",
        "Maldivas",
        "Malí",
        "Malta",
        "Marruecos",
        "Mauricio",
        "Mauritania",
        "Micronesia",
        "Moldavia",
        "Mónaco",
        "Mongolia",
        "Montenegro",
        "Mozambique",
        "Namibia",
        "Nauru",
        "Nepal",
        "Nicaragua",
        "Níger",
        "Nigeria",
        "Noruega",
        "Nueva Zelanda",
        "Omán",
        "Países Bajos",
        "Pakistán",
        "Palaos",
        "Panamá",
        "Papúa Nueva Guinea",
        "Paraguay",
        "Perú",
        "Polonia",
        "Portugal",
        "Reino Unido",
        "República Centroafricana",
        "República Checa",
        "República del Congo",
        "República Democrática del Congo",
        "República Dominicana",
        "República Sudafricana",
        "Ruanda",
        "Rumanía",
        "Rusia",
        "Samoa",
        "San Cristóbal y Nieves",
        "San Marino",
        "San Vicente y las Granadinas",
        "Santa Lucía",
        "Santo Tomé y Príncipe",
        "Senegal",
        "Serbia",
        "Seychelles",
        "Sierra Leona",
        "Singapur",
        "Siria",
        "Somalia",
        "Sri Lanka",
        "Suazilandia",
        "Sudán",
        "Sudán del Sur",
        "Suecia",
        "Suiza",
        "Surinam",
        "Tailandia",
        "Tanzania",
        "Tayikistán",
        "Timor Oriental (Timor-Leste)",
        "Togo",
        "Tonga",
        "Trinidad y Tobago",
        "Túnez",
        "Turkmenistán",
        "Turquía",
        "Tuvalu",
        "Ucrania",
        "Uganda",
        "Uruguay",
        "Uzbekistán",
        "Vanuatu",
        "Venezuela",
        "Vietnam",
        "Yemen",
        "Yibuti (Djibouti)",
        "Zambia",
        "Zimbabue"]
    
}



