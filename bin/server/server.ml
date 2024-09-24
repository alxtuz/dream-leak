let () =
  (* Lwt_engine.set (new Lwt_engine.libev ~backend:Lwt_engine.Ev_backend.kqueue ()) in *)
  Lwt_engine.set (new Lwt_engine.select) in
  Dream.router
    [
      Dream.get "/" (fun _ ->
          Lwt.return
            (Dream.response
               ~headers:[ ("Content-Type", "text/plain") ]
               "On macOS I leak.\n"));
    ]
  |> Dream.logger |> Dream.run ~port:8080
