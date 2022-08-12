using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class Usuario
    {
        public static Modelos.Result GetAll(Modelos.Usuario usuario)
        {
            Modelos.Result result = new Modelos.Result();

            try
            {
                using (DataConnection.JAlmarazDOCSOLUTIONSEntities1 context = new DataConnection.JAlmarazDOCSOLUTIONSEntities1())
                {
                    if (usuario.Nombre == null)
                    {
                        usuario.Nombre = "";
                    }

                    var query = context.UsuarioGetAll(usuario.Nombre).ToList();

                    result.Objects = new List<object>();

                    if (query != null)
                    {
                        foreach (var objUsuario in query)
                        {
                            Modelos.Usuario user = new Modelos.Usuario();

                            user.IdUsuario = objUsuario.IdUsuario;
                            user.Nombre = objUsuario.Nombre;
                            user.ApellidoPaterno = objUsuario.ApellidoPaterno;
                            user.ApellidoMaterno = objUsuario.ApellidoMaterno;
                            user.Edad = objUsuario.Edad.Value;
                            user.FechaNacimiento = objUsuario.FechaNacimiento.Value;

                            result.Objects.Add(user);
                        }
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Error al obtener los datos de la Tabla Poliza";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
        public static Modelos.Result GetById(int IdUsuario)
        {
            Modelos.Result result = new Modelos.Result();
            try
            {
                using (DataConnection.JAlmarazDOCSOLUTIONSEntities1 context = new DataConnection.JAlmarazDOCSOLUTIONSEntities1())
                {
                    var objUsuario = context.UsuarioGetById(IdUsuario).First();

                    if (objUsuario != null)
                    {
                        Modelos.Usuario usuario = new Modelos.Usuario();
                        usuario.IdUsuario = objUsuario.IdUsuario;
                        usuario.Nombre = objUsuario.Nombre;
                        usuario.ApellidoPaterno = objUsuario.ApellidoPaterno;
                        usuario.ApellidoMaterno = objUsuario.ApellidoMaterno;
                        usuario.Edad = objUsuario.Edad.Value;
                        usuario.FechaNacimiento = objUsuario.FechaNacimiento.Value;

                        result.Object = usuario;
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Error al obtener la Poliza";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
        public static Modelos.Result Add(Modelos.Usuario usuario)
        {
            Modelos.Result result = new Modelos.Result();
            try
            {
                using (DataConnection.JAlmarazDOCSOLUTIONSEntities1 context = new DataConnection.JAlmarazDOCSOLUTIONSEntities1())
                {
                    var query = context.UsuarioAdd(usuario.Nombre, usuario.ApellidoPaterno, usuario.ApellidoMaterno, usuario.Edad, usuario.FechaNacimiento);

                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Ocurrio un error al agregar el nuevo usuario :C";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
        public static Modelos.Result Update(Modelos.Usuario usuario)
        {
            Modelos.Result result = new Modelos.Result();
            try
            {
                using (DataConnection.JAlmarazDOCSOLUTIONSEntities1 context = new DataConnection.JAlmarazDOCSOLUTIONSEntities1())
                {
                    var query = context.UsuarioUpdate(usuario.IdUsuario, usuario.Nombre, usuario.ApellidoPaterno, usuario.ApellidoMaterno, usuario.Edad, usuario.FechaNacimiento);
                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Ocurrio un error al actualizar el usuario :C";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
        public static Modelos.Result Delete(int IdUsuario)
        {
            Modelos.Result result = new Modelos.Result();
            try
            {
                using (DataConnection.JAlmarazDOCSOLUTIONSEntities1 context = new DataConnection.JAlmarazDOCSOLUTIONSEntities1())
                {
                    var query = context.UsuarioDelete(IdUsuario);
                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Ocurrio un error al eliminar el Usuario :C";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
    }
}

