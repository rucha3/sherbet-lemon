import akka.actor.ActorSystem
import akka.http.scaladsl.Http
import akka.stream._
import akka.http.scaladsl.server.Directives._

import scala.util.parsing.json.{JSON, JSONObject}

trait RestServer {
  val greetRoute =
    pathPrefix("greet") {
      path(Segment) {
        name => {
          get {
            complete {
              greet(name)
            }
          }
        }
      }
    }

  val healthRoute =
    pathPrefix("health") {
      get {
        complete {
          health
        }
      }
    }

  def greet(name: String): String = {
    val message = "Hello " + name + "!"
    JSONObject(Map("message" -> message)).toString()
  }

  def health: String = JSONObject(Map("status" -> 200)).toString()

  def startServer
}

class RestService extends RestServer {
  implicit val actorSystem = ActorSystem("system")
  implicit val materializer = ActorMaterializer()

  def startServer = {

    Http().bindAndHandle(greetRoute ~ healthRoute, "localhost", 8080)

    println("Started server at 8080")
  }

}

object RestService {
  def main(args: Array[String]): Unit = {
    new RestService().startServer
  }
}
