<?php

include "setting.php";


function get($url, array $query = [], array $headers = []) {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url . '?' . http_build_query($query));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_TIMEOUT, '3');
    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
    $result = curl_exec($curl);
    curl_close($curl);
    return $result;
}

function post($url, array $fields = []) {
    $curl = curl_init();
    curl_setopt($curl,CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
    curl_setopt($curl,CURLOPT_POST, sizeof($fields));
    curl_setopt($curl,CURLOPT_POSTFIELDS, $fields);
    $result = curl_exec($curl);
    curl_close($curl);
    return $result;
}

function obtainAccessToken($username, $password) {
    $response = post('https://nyu-demo.survos.com/api1.0/security/login', [
        'username' => $username, 'password' => $password
    ]);
    $data = json_decode($response, true);
    return $data['accessToken'];
}

function getJobs($projectCode, $page, $paginate, $accessToken) {
    $response = get('http://posse.l.survos.net/app_dev.php/api1.0/jobs', [
        'projectCode' => $projectCode,
        'page' => $page,
        'paginate' => $paginate,
    ], [
        'authorization: Bearer '.$accessToken,
    ]);
    return json_decode($response, true);
}

$accessToken = obtainAccessToken(username, password);
printf("%s\n", $accessToken);
$jobs = getJobs('demo', 1, 10, $accessToken);
print_r($jobs);
