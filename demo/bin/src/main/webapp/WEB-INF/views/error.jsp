  <div layout:fragment="content">
    <h1>Error Page</h1>
    error code : <span th:text="${code}"></span>
    <br>error msg : <span th:text="${msg}"></span>
    <br>timestamp : <span th:text="${timestamp}"></span>
  </div>
