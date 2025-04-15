<?php

namespace App\Controller;

use App\Entity\Appointment;
use App\Form\AppointmentType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class SpecialistController extends AbstractController
{
    #[Route('/specialist', name: 'app_specialist_home')]
    public function index(): Response
    {
        return $this->render('specialist/index.html.twig', [
            'controller_name' => 'SpecialistController',
        ]);
    }

//    #[Route('/specialist/appointment', name: 'app_appointment_new')]
//    public function new(Request $request, EntityManagerInterface $entityManager): Response
//    {
//        $appointment = new Appointment();
//        $form = $this->createForm(AppointmentType::class, $appointment);
//        $form->handleRequest($request);
//        if ($form->isSubmitted() && $form->isValid()) {
//            $entityManager->persist($appointment);
//            $entityManager->flush();
//            $this->addFlash("success", "Appointment added successfully");
//            return $this->redirectToRoute('app_specialist_home');
//        }
//
//        return $this->render('specialist/index.html.twig', [
//            'form' => $form,
//        ]);
//    }

}
