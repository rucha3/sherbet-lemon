import akka.http.scaladsl.model.{HttpRequest, Uri}
import akka.http.scaladsl.testkit.ScalatestRouteTest
import org.scalatest.{FlatSpecLike, Matchers}

import scala.util.parsing.json.JSONObject

class RestServiceTest extends RestServer with FlatSpecLike with Matchers with ScalatestRouteTest{

  val restService = new RestService()

  "Service#greet" should "greet the input name" in {
    val output = JSONObject(Map("message"-> "Hello James!")).toString()
    restService.greet("James") should be (output)
  }

  "Service#status" should "send ok status" in {
    val output = JSONObject(Map("status"-> 200)).toString()
    restService.health should be (output)
  }

  "Service#greetApi" should "greet input name" in {
    val httpRequest = HttpRequest(uri = Uri("http://localhost:8080/greet/James"))
    httpRequest ~> restService.greetRoute ~> check {
      responseAs[String] should be (JSONObject(Map("message"-> "Hello James!")).toString())
    }
  }

  "Service#healthApi" should "give status 200" in {
    val httpRequest = HttpRequest(uri = Uri("http://localhost:8080/health"))
    httpRequest ~> restService.healthRoute ~> check {
      responseAs[String] should be (JSONObject(Map("status"-> 200)).toString())
    }
  }

  override def startServer: Unit = ???
}
