using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Presentation.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        [HttpGet]
        public ActionResult GetAll()
        {

            Modelos.Result resultUsuario = Business.Usuario.GetAll(new Modelos.Usuario());

            if (resultUsuario.Correct)
            {
                Modelos.Usuario usuario = new Modelos.Usuario();
                usuario.Usuarios = resultUsuario.Objects;
                return View(usuario);
            }
            else
            {
                ViewBag.Message = resultUsuario.ErrorMessage;
                return PartialView("Modal");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Form(int? IdUsuario)
        {
            Modelos.Usuario usuario = new Modelos.Usuario();
            if (IdUsuario == null)
            {
                return View(usuario);
            }
            else
            {
                Modelos.Result resultUsuario = Business.Usuario.GetById(IdUsuario.Value);
                if (resultUsuario.Correct)
                {
                    usuario = ((Modelos.Usuario)resultUsuario.Object);
                    return View(usuario);
                }
            }
            return View();
        }


        [HttpPost]
        public ActionResult Form(Modelos.Usuario usuario)
        {
            Modelos.Result result = new Modelos.Result();
            if (usuario.IdUsuario == 0) //ALTA DE NUEVOS USUARIO
            {
                result = Business.Usuario.Add(usuario);
                if (result.Correct)
                {
                    ViewBag.Mensaje = "El usuario se agregó correctamente C:";
                }
                else
                {
                    ViewBag.Mensaje = "El usuario no se agregó correctamente y existen los siguientes errores: " + result.ErrorMessage;
                }
            }
            else //EDITAR DATOS DEL USUARIO
            {
                result = Business.Usuario.Update(usuario);

                if (result.Correct)
                {
                    ViewBag.Mensaje = "Usuario actualizado correctamente C:";
                }
                else
                {
                    ViewBag.Mensaje = "El Usuario no se actualizó correctamente y existe el siguiente error: " + result.ErrorMessage;
                }
            }
            return PartialView("Modal");
        }

        public ActionResult Delete(int IdUsuario)
        {
            Modelos.Result result = Business.Usuario.Delete(IdUsuario);

            if (result.Correct)
            {
                ViewBag.Mensaje = "Usuario eliminado de manera correcta C:";
            }
            else
            {
                ViewBag.Mensaje = "Ocurrio un error al eliminar el usuario :C" + result.ErrorMessage;
            }
            return PartialView("Modal");
        }
        //FILTRADO
        [HttpPost]
        public ActionResult GetAll(Modelos.Usuario usuario)
        {
            Modelos.Result resultUsuarios = Business.Usuario.GetAll(usuario);

            if (resultUsuarios.Correct)
            {
                usuario.Usuarios = new List<object>();
                usuario.Usuarios = resultUsuarios.Objects;
            }
            else
            {
                ViewBag.Message = resultUsuarios.ErrorMessage;
                return PartialView("Modal");
            }
            return View(usuario);
        }
    }
}
