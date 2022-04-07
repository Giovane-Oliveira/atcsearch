class Post{
  Post(this._cod_carga, this._cod_empresa);

  int _cod_empresa;
  int _cod_carga;

  int get cod_carga => _cod_carga;

  set cod_carga(int value) {
    _cod_carga = value;
  }



  int get cod_empresa => _cod_empresa;

  set cod_empresa(int value) {
    _cod_empresa = value;
  }



}